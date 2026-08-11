import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entity/auth_session.dart';
import '../entity/login_result.dart';
import '../repositories/auth_repository.dart';

class AuthUsecase {
  final AuthRepository repository;

  AuthUsecase(this.repository);

  Future<Either<Failure, String>> sendOtp(String phoneNumber) {
    return repository.sendOtp(phone: phoneNumber);
  }

  Future<Either<Failure, LoginResult>> login({
    required String phoneNumber,
    required String otp,
    required String otpId,
  }) async {
    return repository.login(phone: phoneNumber, otp: otp, otpId: otpId);
  }

  Future<Either<Failure, AuthSession>> getJwt() async {
    return repository.getJwt();
  }

  Future<Either<Failure, String>> registerUser({
    required String address,
    required String name,
    required String email,
    required String phone,
  }) async {
    return repository.registerUser(
      address: address,
      phone: phone,
      name: name,
      email: email,
    );
  }
}
