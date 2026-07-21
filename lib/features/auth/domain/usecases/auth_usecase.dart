import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entity/login_result.dart';
import '../entity/user_entity.dart';
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

  Future<void> registerUser(UserEntity userData, String name, String email) {
    // Implement registration logic here
    // This might involve calling a method on the repository to create a new user
    throw UnimplementedError('Registration not implemented yet');
  }
}
