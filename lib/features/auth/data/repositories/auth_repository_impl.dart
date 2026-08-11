// import '../../../../core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../core/constants/common.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/auth_session.dart';
import '../../domain/entity/login_result.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasource/auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failure, String>> sendOtp({required String phone}) async {
    final response = await authDataSource.sendOtp(phone: phone);

    return response;
  }

  @override
  Future<Either<Failure, AuthSession>> getJwt() async {
    final response = await authDataSource.getJwt();

    return response;
  }

  @override
  Future<Either<Failure, LoginResult>> login({
    required String phone,
    required String otp,
    required String otpId,
  }) async {
    final response = await authDataSource.login(
      phone: phone,
      otp: otp,
      otpId: otpId,
    );
    if (response.isRight()) {
      response.fold((l) => {}, (result) {
        setValue(isLoggedInKey, true);
        setValue(userIdkey, result.user.id);
        SecureStorage.setValue(accessTokenKey, result.session.accessToken);
      });
    }
    return response;
  }

  @override
  Future<Either<Failure, String>> registerUser({
    required String address,
    required String name,
    required String email,
    required String phone,
  }) async {
    final response = await authDataSource.register(
      address: address,
      name: name,
      email: email,
      phone: phone,
    );
    return response;
  }
}
