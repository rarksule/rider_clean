// presentation/providers/location_providers.dart
import 'package:location/location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/location_repository.dart';
import '../../data/repositories/location_repository_impl.dart';
import '../../domain/usecase/location_usecase.dart';

part 'location_providers.g.dart';

@riverpod
LocationRepository locationRepository(Ref ref) =>
    LocationRepositoryImpl(Location.instance);

@riverpod
LocationUsecase locationUsecase(Ref ref) =>
    LocationUsecase(ref.read(locationRepositoryProvider));

@riverpod
class Permission extends _$Permission {
  @override
  FutureOr<bool?> build() => false;

  Future<bool> hasPermission() async {
    state = AsyncLoading();
    final permissionResult = await ref
        .read(locationUsecaseProvider)
        .hasPermission();
    final serviceRresult = await ref
        .read(locationUsecaseProvider)
        .isServiceEnabled();
    state = AsyncData(permissionResult && serviceRresult);

    return permissionResult && serviceRresult;
  }

  Future<void> requestPermission() async {
    final result = await ref.read(locationUsecaseProvider).requestPermission();

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

@riverpod
class GeoLocation extends _$GeoLocation {
  @override
  FutureOr<LocationData?> build() => null;

  Future<void> getLocation() async {
    state = const AsyncLoading();
    final result = await ref.read(locationUsecaseProvider).getCurrentLocation();
    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

@riverpod
Stream<LocationData> locationStream(Ref ref) {
  final repo = ref.watch(locationUsecaseProvider);
  return repo.watchLocation();
}
