// features/splash/data/repositories/splash_repository_impl.dart

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/data/models/user_model.dart';
import '../datasources/splash_local_data_source.dart';
import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_remote_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashLocalDatasource local;
  final SplashRemoteDatasource remote;
  SplashRepositoryImpl({required this.local, required this.remote});

  @override
  bool get isFirstTime => local.isFirstTime;

  @override
  bool get isLoggedIn => local.isLoggedIn;

  @override
  Future<Either<Failure, UserModel>> getUserStatus() async {
    final id = local.getUserId;
    if (id == 0) return Left(ProcessFailure("local data cannot be retrieved"));

    return await remote.getUserDetail(userId: id);
  }
}
