// features/splash/domain/repositories/splash_repository.dart

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/data/models/user_model.dart';

abstract class SplashRepository {
  bool get isFirstTime;
  bool get isLoggedIn;
  Future<Either<Failure,UserModel>> getUserStatus();
}