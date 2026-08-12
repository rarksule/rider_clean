// data/repositories/location_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:rider_clean/features/location/data/datasource/location_datasource.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource locationDatasource;

  LocationRepositoryImpl({required this.locationDatasource});

  @override
  Future<bool> isServiceEnabled() => locationDatasource.isServiceEnabled();

  @override
  Future<Either<Failure, LocationData>> getCurrentLocation() =>
      locationDatasource.getCurrentLocation();

  @override
  Stream<LocationData> watchLocation() => locationDatasource.watchLocation();
}
