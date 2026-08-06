import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/auth_session.dart';
import '../entity/login_result.dart';
import '../entity/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp({required String phone});
  Future<Either<Failure, LoginResult>> login({
    required String phone,
    required String otp,
    required String otpId,
  });
  Future<void> registerUser(UserEntity userData, String name, String email);
  Future<Either<Failure,AuthSession>> getJwt();
}
