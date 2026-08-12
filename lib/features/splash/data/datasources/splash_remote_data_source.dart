// features/splash/data/datasources/splash_remote_datasource.dart

import 'package:dartz/dartz.dart';
import 'package:rider_clean/core/constants/enums.dart';
import '../../../../core/constants/url_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_classes.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../../core/network/api_request_handler.dart';

class SplashRemoteDatasource {
  final ApiUrl phpUrl;
  final ApiUrl nodeUrl;

  SplashRemoteDatasource({required this.phpUrl,required this.nodeUrl});

  Future<Either<Failure, UserModel>> getUserDetail({
    required String userId,
  }) async {
    try {
      final url = phpUrl.getUri(
        UrlConstants.getUserDetail,
        queryParameters: {"userId": userId},
      );

      final res = await ApiRequestHandler.request(url,method: HttpMethod.post);
      if (res.isSuccess) {
        final data = res.data!;
        return Right(UserModel.fromJson(data['data']));
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
}
