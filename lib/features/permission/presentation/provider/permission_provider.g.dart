// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(permissionDatasource)
final permissionDatasourceProvider = PermissionDatasourceProvider._();

final class PermissionDatasourceProvider
    extends
        $FunctionalProvider<
          PermissionDatasource,
          PermissionDatasource,
          PermissionDatasource
        >
    with $Provider<PermissionDatasource> {
  PermissionDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionDatasourceHash();

  @$internal
  @override
  $ProviderElement<PermissionDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionDatasource create(Ref ref) {
    return permissionDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionDatasource>(value),
    );
  }
}

String _$permissionDatasourceHash() =>
    r'196ca5e1ca8a79e9b8400d38ffc4375fba419866';

@ProviderFor(permissionRepository)
final permissionRepositoryProvider = PermissionRepositoryProvider._();

final class PermissionRepositoryProvider
    extends
        $FunctionalProvider<
          PermissionRepository,
          PermissionRepository,
          PermissionRepository
        >
    with $Provider<PermissionRepository> {
  PermissionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionRepositoryHash();

  @$internal
  @override
  $ProviderElement<PermissionRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionRepository create(Ref ref) {
    return permissionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionRepository>(value),
    );
  }
}

String _$permissionRepositoryHash() =>
    r'b02eb2fb211bd87a9add9e2b292deb8c4e8aaa6c';

@ProviderFor(permissionUsecase)
final permissionUsecaseProvider = PermissionUsecaseProvider._();

final class PermissionUsecaseProvider
    extends
        $FunctionalProvider<
          PermissionUsecase,
          PermissionUsecase,
          PermissionUsecase
        >
    with $Provider<PermissionUsecase> {
  PermissionUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionUsecaseHash();

  @$internal
  @override
  $ProviderElement<PermissionUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PermissionUsecase create(Ref ref) {
    return permissionUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PermissionUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PermissionUsecase>(value),
    );
  }
}

String _$permissionUsecaseHash() => r'2fc10e262621ecdc127eefca9c57572d930265d7';

@ProviderFor(MyPermission)
final myPermissionProvider = MyPermissionProvider._();

final class MyPermissionProvider
    extends
        $AsyncNotifierProvider<
          MyPermission,
          Either<List<PermissionType>, bool>
        > {
  MyPermissionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myPermissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myPermissionHash();

  @$internal
  @override
  MyPermission create() => MyPermission();
}

String _$myPermissionHash() => r'3fae6766f72073798a92a3bdb4c764d904a1ee1b';

abstract class _$MyPermission
    extends $AsyncNotifier<Either<List<PermissionType>, bool>> {
  FutureOr<Either<List<PermissionType>, bool>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Either<List<PermissionType>, bool>>,
              Either<List<PermissionType>, bool>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Either<List<PermissionType>, bool>>,
                Either<List<PermissionType>, bool>
              >,
              AsyncValue<Either<List<PermissionType>, bool>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
