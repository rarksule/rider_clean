// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locationDatasource)
final locationDatasourceProvider = LocationDatasourceProvider._();

final class LocationDatasourceProvider
    extends
        $FunctionalProvider<
          LocationDatasource,
          LocationDatasource,
          LocationDatasource
        >
    with $Provider<LocationDatasource> {
  LocationDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'locationDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$locationDatasourceHash();

  @$internal
  @override
  $ProviderElement<LocationDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocationDatasource create(Ref ref) {
    return locationDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocationDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocationDatasource>(value),
    );
  }
}

String _$locationDatasourceHash() =>
    r'a041869f0b5d68f732bc5af3ca103600b5918838';

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
    r'17a5cd20ce3d421abcbb3bd44ad890e7b4c896f1';

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
