import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import '../../../../core/error/failures.dart';
import '../repositories/location_repository.dart';

class LocationUsecase {
  final LocationRepository repository;

  LocationUsecase(this.repository);
  Future<bool> isServiceEnabled() => repository.isServiceEnabled();
  Future<Either<Failure, LocationData>> getCurrentLocation() =>
      repository.getCurrentLocation();
  Stream<LocationData> watchLocation() => repository.watchLocation();
}
