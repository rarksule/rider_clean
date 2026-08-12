import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/core/constants/enums.dart';
import 'package:rider_clean/features/permission/data/datasource/permission_datasource.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';

class LocationDatasource {
  final Location location;
  LocationDatasource({required this.location});

  Future<bool> isServiceEnabled() => location.serviceEnabled();

  Future<Either<Failure, LocationData>> getCurrentLocation() async {
    PermissionDatasource permissionDatasource = PermissionDatasource();
    var serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return Left(ProcessFailure("location service is not Enabled"));
      }
    }
    if (await permissionDatasource.hasPermission(
      type: PermissionType.location,
    )) {
      final data = await location.getLocation();
      setValue(locationDataKey, data);
      return Right(data);
    }
    return Left(ProcessFailure("Location permission not granted"));
  }

  Stream<LocationData> watchLocation() {
    return location.onLocationChanged;
  }
}
