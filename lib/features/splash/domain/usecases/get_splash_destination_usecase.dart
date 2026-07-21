// features/splash/domain/usecases/get_splash_destination_usecase.dart
import 'package:dartz/dartz.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';
import '../repositories/splash_repository.dart';

class GetSplashDestinationUseCase {
  final SplashRepository repository;
  GetSplashDestinationUseCase(this.repository);

  Future<Either<Failure, SplashDestination>> call() async {
    if (!repository.isLoggedIn) {
      final firstTime = repository.isFirstTime;
      return firstTime
          ? Right(SplashDestination.introduction)
          : Right(SplashDestination.signIn);
    }

    final status = await repository.getUserStatus();
    return status.fold((failure) => Left(failure), (user) {
      SplashDestination dest = SplashDestination.signIn;
      if (user.status.toLowerCase() == active) {
        dest = SplashDestination.dashboard;
      }
      return Right(dest);
    });
  }
}
