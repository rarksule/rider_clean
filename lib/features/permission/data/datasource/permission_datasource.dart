import 'package:dartz/dartz.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rider_clean/core/constants/enums.dart';
import '../../../../core/error/failures.dart';

class PermissionDatasource {
  Future<bool> hasPermission({required PermissionType type}) async {
    switch (type) {
      case PermissionType.file:
        return await Permission.manageExternalStorage.isGranted;
      case PermissionType.contacts:
        return await Permission.contacts.isGranted;
      case PermissionType.location:
        return await Permission.location.isGranted;
      case PermissionType.notification:
        return await Permission.notification.isGranted;
      default:
        return await Permission.locationAlways.isGranted;
    }
  }

  Future<bool> requestPermission({required PermissionType type}) async {
    PermissionStatus status = PermissionStatus.denied;
    switch (type) {
      case PermissionType.file:
        status = await Permission.manageExternalStorage.request();
      case PermissionType.contacts:
        status = await Permission.contacts.request();
      case PermissionType.location:
        status = await Permission.location.request();
      case PermissionType.notification:
        status = await Permission.notification.request();
      default:
        status = await Permission.locationAlways.request();
    }

    return status == PermissionStatus.granted;
  }

  Future<bool> isPermanentlyDenied({required PermissionType type}) async {
    switch (type) {
      case PermissionType.file:
        return await Permission.manageExternalStorage.isGranted;
      case PermissionType.contacts:
        return await Permission.contacts.isPermanentlyDenied;
      case PermissionType.location:
        return await Permission.location.isPermanentlyDenied;
      case PermissionType.notification:
        return await Permission.notification.isPermanentlyDenied;
      default:
        return await Permission.locationAlways.isPermanentlyDenied;
    }
  }

  Future<bool> isAllPermissionsGranted() async {
    bool status = false;
    for (PermissionType type in PermissionType.values) {
      status = await hasPermission(type: type);
      if (!status) break;
    }
    return status;
  }

  Future<Either<Failure, List<PermissionType>>> getDeniedPermissions() async {
    bool status = false;
    List<PermissionType> deniedPermissions = [];
    for (PermissionType type in PermissionType.values) {
      status = await hasPermission(type: type);
      if (!status) deniedPermissions.add(type);
    }
    if (deniedPermissions.isEmpty) {
      return Right([]);
    }
    List<PermissionType> permanentlyDeniedPermissions = [];
    bool isPermanent = false;
    for (PermissionType type in deniedPermissions) {
      isPermanent = await isPermanentlyDenied(type: type);
      if (isPermanent) permanentlyDeniedPermissions.add(type);
    }
    if (permanentlyDeniedPermissions.isEmpty) {
      return Right(deniedPermissions);
    }
    return Left(
      ProcessFailure(
        "permission ${permanentlyDeniedPermissions.first} isDeniedPermantly please allow it in settings",
      ),
    );
  }
}
