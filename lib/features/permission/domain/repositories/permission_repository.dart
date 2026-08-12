// domain/repositories/location_repository.dart
import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';

abstract class PermissionRepository {
  Future<bool> hasPermission({required PermissionType type});
  Future<bool> requestPermission({required PermissionType type});
  Future<bool> isPermanentlyDenied({required PermissionType type});
  Future<bool> isAllPermissionsGranted();
  Future<Either<Failure, List<PermissionType>>> getDeniedPermissions();
}
