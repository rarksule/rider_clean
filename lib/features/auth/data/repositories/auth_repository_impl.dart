// import '../../../../core/errors/failures.dart';

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
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

    return response;
  }

  @override
  Future<void> registerUser(
    UserEntity userData,
    String name,
    String email,
  ) async {
    throw UnimplementedError('Registration flow is not implemented yet.');
  }
}
