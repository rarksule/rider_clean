import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';
import '../repositories/permission_repository.dart';

class PermissionUsecase {
  final PermissionRepository repository;
  PermissionUsecase(this.repository);

  Future<bool> hasPermission({required PermissionType type}) =>
      repository.hasPermission(type: type);
  Future<bool> requestPermission({required PermissionType type}) =>
      repository.requestPermission(type: type);
  Future<bool> isPermanentlyDenied({required PermissionType type}) =>
      repository.isPermanentlyDenied(type: type);
  Future<Either<Failure, List<PermissionType>>> getDeniedPermissions() =>
      repository.getDeniedPermissions();
  Future<bool> isAllPermissionsGranted() =>
      repository.isAllPermissionsGranted();
}
