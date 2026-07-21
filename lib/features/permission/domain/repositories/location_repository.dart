// domain/repositories/location_repository.dart
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

import '../../../../core/error/failures.dart';

abstract class LocationRepository {
  
  Future<bool> hasPermission();
  Future<bool> isServiceEnabled();
  Future<Either<Failure,bool>> requestPermission();
  Future<Either<Failure,LocationData>> getCurrentLocation();
  Stream<LocationData> watchLocation();

}
