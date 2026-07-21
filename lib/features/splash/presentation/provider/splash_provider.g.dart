// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashRemoteDataSource)
final splashRemoteDataSourceProvider = SplashRemoteDataSourceProvider._();

final class SplashRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          SplashRemoteDatasource,
          SplashRemoteDatasource,
          SplashRemoteDatasource
        >
    with $Provider<SplashRemoteDatasource> {
  SplashRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<SplashRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SplashRemoteDatasource create(Ref ref) {
    return splashRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashRemoteDatasource>(value),
    );
  }
}

String _$splashRemoteDataSourceHash() =>
    r'22d9f4eb21621846f9f60933fe14b8fb8368d347';

@ProviderFor(splashLocalDataSource)
final splashLocalDataSourceProvider = SplashLocalDataSourceProvider._();

final class SplashLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SplashLocalDatasource,
          SplashLocalDatasource,
          SplashLocalDatasource
        >
    with $Provider<SplashLocalDatasource> {
  SplashLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SplashLocalDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SplashLocalDatasource create(Ref ref) {
    return splashLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashLocalDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashLocalDatasource>(value),
    );
  }
}

String _$splashLocalDataSourceHash() =>
    r'a7f5fc52943aaeea5deff2c34d06556a2a1c67fd';

@ProviderFor(splashRepository)
final splashRepositoryProvider = SplashRepositoryProvider._();

final class SplashRepositoryProvider
    extends
        $FunctionalProvider<
          SplashRepository,
          SplashRepository,
          SplashRepository
        >
    with $Provider<SplashRepository> {
  SplashRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashRepositoryHash();

  @$internal
  @override
  $ProviderElement<SplashRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashRepository create(Ref ref) {
    return splashRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashRepository>(value),
    );
  }
}

String _$splashRepositoryHash() => r'7b7a03cea35d7c374fbc3c776a297d8dc2250e71';

@ProviderFor(getSplashDestinationUseCase)
final getSplashDestinationUseCaseProvider =
    GetSplashDestinationUseCaseProvider._();

final class GetSplashDestinationUseCaseProvider
    extends
        $FunctionalProvider<
          GetSplashDestinationUseCase,
          GetSplashDestinationUseCase,
          GetSplashDestinationUseCase
        >
    with $Provider<GetSplashDestinationUseCase> {
  GetSplashDestinationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSplashDestinationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSplashDestinationUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetSplashDestinationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSplashDestinationUseCase create(Ref ref) {
    return getSplashDestinationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSplashDestinationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSplashDestinationUseCase>(value),
    );
  }
}

String _$getSplashDestinationUseCaseHash() =>
    r'9f3737362098bb294d0eda7b82c22b84d5d3a080';

@ProviderFor(SplashState)
final splashStateProvider = SplashStateProvider._();

final class SplashStateProvider
    extends $AsyncNotifierProvider<SplashState, SplashDestination?> {
  SplashStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashStateHash();

  @$internal
  @override
  SplashState create() => SplashState();
}

String _$splashStateHash() => r'0313274b44727543dce4fef3f495536bff576342';

abstract class _$SplashState extends $AsyncNotifier<SplashDestination?> {
  FutureOr<SplashDestination?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<SplashDestination?>, SplashDestination?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SplashDestination?>, SplashDestination?>,
              AsyncValue<SplashDestination?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
