import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/providers/global_providers.dart';
import '../../data/datasources/splash_local_data_source.dart';
import '../../data/datasources/splash_remote_data_source.dart';
import '../../data/repositories/splash_repository_impl.dart';
import '../../domain/repositories/splash_repository.dart';
import '../../domain/usecases/get_splash_destination_usecase.dart';

part 'splash_provider.g.dart';

@riverpod
SplashRemoteDatasource splashRemoteDataSource(Ref ref) {
  return SplashRemoteDatasource(
    ref.read(nodeApiUrlProvider),
    ref.read(phpApiUrlProvider),
  );
}

@riverpod
SplashLocalDatasource splashLocalDataSource(Ref ref) {
  return SplashLocalDatasource();
}

@riverpod
SplashRepository splashRepository(Ref ref) {
  return SplashRepositoryImpl(
    local: ref.read(splashLocalDataSourceProvider),
    remote: ref.read(splashRemoteDataSourceProvider),
  );
}

@riverpod
GetSplashDestinationUseCase getSplashDestinationUseCase(Ref ref) {
  return GetSplashDestinationUseCase(ref.read(splashRepositoryProvider));
}

@riverpod
class SplashState extends _$SplashState {
  @override
  FutureOr<SplashDestination?> build() => null;

  Future<void> resolveDestination() async {
    state = const AsyncLoading();

    final result = await ref.read(getSplashDestinationUseCaseProvider).call();

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (voiData) => AsyncData(voiData),
    );
  }
}
