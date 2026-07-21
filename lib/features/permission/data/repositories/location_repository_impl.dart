// data/repositories/location_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final Location _location;

  LocationRepositoryImpl(this._location);

  @override
  Future<bool> isServiceEnabled() => _location.serviceEnabled();

  @override
  Future<bool> hasPermission() async {
    final status = await _location.hasPermission();
    return status == PermissionStatus.granted;
  }

  @override
  Future<Either<Failure, bool>> requestPermission() async {
    var status = await _location.hasPermission();

    if (status == PermissionStatus.deniedForever) {
      return Left(
        ProcessFailure(
          "Location Permission denied ForeEver please Enable it in Settings",
        ),
      );
    }
    if (status == PermissionStatus.denied) {
      status = await _location.requestPermission();
    }
    return Right(status == PermissionStatus.granted);
  }

  @override
  Future<Either<Failure, LocationData>> getCurrentLocation() async {
    var serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return Left(ProcessFailure("location service is not Enabled"));
      }
    }
    if (await hasPermission()) {
      final data = await _location.getLocation();
      setValue("locationData",data);
      return Right(data);
    }
    return Left(ProcessFailure("Location permission not granted"));
  }

  @override
  Stream<LocationData> watchLocation() {
    return _location.onLocationChanged;
  }
}
