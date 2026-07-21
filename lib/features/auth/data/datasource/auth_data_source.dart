import 'package:dartz/dartz.dart';
import 'package:rider_clean/features/auth/domain/entity/auth_session.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/constants/url_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_classes.dart';
import '../../../../core/network/api_request_handler.dart';
import '../../domain/entity/login_result.dart';
import '../models/user_model.dart';

class AuthDataSource {
  final ApiUrl phpUrl;
  final ApiUrl nodeUrl; // Replace with your actual API base URL

  AuthDataSource(this.nodeUrl, this.phpUrl);

  /// Step 1: Send OTP
  Future<Either<Failure, String>> sendOtp({required String phone}) async {
    try {
      final url = phpUrl.getUri(UrlConstants.initializeLogin);

      final res = await ApiRequestHandler.request(
        url,
        method: HttpMethod.post,
        body: {'phone_number': phone},
      );
      if (res.isSuccess) {
        return Right(res.data!["otp_id"]);
      } else {
        throw ProcessException(res.message);
      }
    } on UnauthorizedException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on JsonException catch (e) {
      return Left(JsonFailure(e.message));
    } on ProcessException catch (e) {
      return Left(ProcessFailure(e.message));
    } catch (_) {
      return Left(const UnknownFailure());
    }
  }

  /// Step 2: Verify OTP and get user + apiKey
  Future<Either<Failure, LoginResult>> login({
    required String phone,
    required String otp,
    required String otpId,
  }) async {
    try {
      final url = phpUrl.getUri(UrlConstants.login);

      final res = await ApiRequestHandler.request(
        url,
        method: HttpMethod.post,
        body: {'phone_number': phone, 'otp': otp, 'otp_id': otpId},
      );
      if (res.isSuccess) {
        final data = res.data!;
        return Right(
          LoginResult(
            user: UserModel.fromJson(data['data']),
            session: AuthSession(apiKey: data['data']['api_token']),
          ),
        );
      } else {
        return Left(ProcessFailure(res.message));
      }
    } on UnauthorizedException catch (e) {
      return Left(InvalidCredentialsFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on JsonException catch (e) {
      return Left(JsonFailure(e.message));
    } on ProcessException catch (e) {
      return Left(ProcessFailure(e.message));
    } catch (_) {
      return Left(const UnknownFailure());
    }
  }
}
