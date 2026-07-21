// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationRepository)
final locationRepositoryProvider = LocationRepositoryProvider._();

final class LocationRepositoryProvider
    extends
        $FunctionalProvider<
          LocationRepository,
          LocationRepository,
          LocationRepository
        >
    with $Provider<LocationRepository> {
  LocationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationRepositoryHash();

  @$internal
  @override
  $ProviderElement<LocationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationRepository create(Ref ref) {
    return locationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationRepository>(value),
    );
  }
}

String _$locationRepositoryHash() =>
    r'f9f09a10a1e793c8d4766cb34ec58084deaa4776';

@ProviderFor(locationUsecase)
final locationUsecaseProvider = LocationUsecaseProvider._();

final class LocationUsecaseProvider
    extends
        $FunctionalProvider<LocationUsecase, LocationUsecase, LocationUsecase>
    with $Provider<LocationUsecase> {
  LocationUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationUsecaseHash();

  @$internal
  @override
  $ProviderElement<LocationUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LocationUsecase create(Ref ref) {
    return locationUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationUsecase>(value),
    );
  }
}

String _$locationUsecaseHash() => r'43a05d4df274028f606ac66a227886a50a4e309d';

@ProviderFor(Permission)
final permissionProvider = PermissionProvider._();

final class PermissionProvider
    extends $AsyncNotifierProvider<Permission, bool?> {
  PermissionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'permissionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$permissionHash();

  @$internal
  @override
  Permission create() => Permission();
}

String _$permissionHash() => r'77d1ef8800e7fe8681876c6abad5a1096dd9fd01';

abstract class _$Permission extends $AsyncNotifier<bool?> {
  FutureOr<bool?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool?>, bool?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool?>, bool?>,
              AsyncValue<bool?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(GeoLocation)
final geoLocationProvider = GeoLocationProvider._();

final class GeoLocationProvider
    extends $AsyncNotifierProvider<GeoLocation, LocationData?> {
  GeoLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geoLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geoLocationHash();

  @$internal
  @override
  GeoLocation create() => GeoLocation();
}

String _$geoLocationHash() => r'843fc5a417d297c015abc6d515cd36b509bd65d3';

abstract class _$GeoLocation extends $AsyncNotifier<LocationData?> {
  FutureOr<LocationData?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LocationData?>, LocationData?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocationData?>, LocationData?>,
              AsyncValue<LocationData?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(locationStream)
final locationStreamProvider = LocationStreamProvider._();

final class LocationStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocationData>,
          LocationData,
          Stream<LocationData>
        >
    with $FutureModifier<LocationData>, $StreamProvider<LocationData> {
  LocationStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationStreamHash();

  @$internal
  @override
  $StreamProviderElement<LocationData> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<LocationData> create(Ref ref) {
    return locationStream(ref);
  }
}

String _$locationStreamHash() => r'7ff03d1284db3592fa553b83f8bfe66cb46f5831';
