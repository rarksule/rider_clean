import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/auth_session.dart';
import '../entity/login_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp({required String phone});
  Future<Either<Failure, LoginResult>> login({
    required String phone,
    required String otp,
    required String otpId,
  });
  Future<Either<Failure, String>> registerUser({
    required String address,
    required String name,
    required String email,
    required String phone,
  });
  Future<Either<Failure, AuthSession>> getJwt();
  Future<Either<Failure, Map<String,dynamic>>> getAppSettings();
  
}
