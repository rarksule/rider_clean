// data/repositories/location_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:rider_clean/features/permission/data/datasource/permission_datasource.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/permission_repository.dart';

class PermissionRepositoryImpl implements PermissionRepository {
  final PermissionDatasource permissionDatasource;

  PermissionRepositoryImpl({required this.permissionDatasource});

  @override
  Future<bool> hasPermission({required PermissionType type}) =>
      permissionDatasource.hasPermission(type: type);

  @override
  Future<bool> requestPermission({required PermissionType type}) =>
      permissionDatasource.requestPermission(type: type);

  @override
  Future<bool> isPermanentlyDenied({required PermissionType type}) =>
      permissionDatasource.isPermanentlyDenied(type: type);

  @override
  Future<bool> isAllPermissionsGranted() =>
      permissionDatasource.isAllPermissionsGranted();

  @override
  Future<Either<Failure, List<PermissionType>>> getDeniedPermissions() =>
      permissionDatasource.getDeniedPermissions();
}
