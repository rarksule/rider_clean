import 'package:dartz/dartz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/error/failures.dart';
import '../../data/datasource/permission_datasource.dart';
import '../../data/repositories/permission_repository_impl.dart';
import '../../domain/repositories/permission_repository.dart';
import '../../domain/usecase/permission_usecase.dart';

part 'permission_provider.g.dart';

@riverpod
PermissionDatasource permissionDatasource(Ref ref) => PermissionDatasource();

@riverpod
PermissionRepository permissionRepository(Ref ref) => PermissionRepositoryImpl(
  permissionDatasource: ref.read(permissionDatasourceProvider),
);

@riverpod
PermissionUsecase permissionUsecase(Ref ref) =>
    PermissionUsecase(ref.read(permissionRepositoryProvider));

@riverpod
class MyPermission extends _$MyPermission {
  @override
  FutureOr<Either<List<PermissionType>, bool>> build() => Right(false);

  Future<bool> hasPermission({required PermissionType type}) async {
    state = AsyncLoading();
    final permissionUsecase = ref.read(permissionUsecaseProvider);
    final permissionResult = await permissionUsecase.hasPermission(type: type);
    state = AsyncData(Right(permissionResult));

    return permissionResult;
  }

  Future<bool> requestPermission({required PermissionType type}) async {
    final result = await ref
        .read(permissionUsecaseProvider)
        .requestPermission(type: type);

    state = AsyncData(Right(result));
    return result;
  }

  Future<bool> isPermanentlyDenied({required PermissionType type}) async {
    final result = await ref
        .read(permissionUsecaseProvider)
        .isPermanentlyDenied(type: type);

    state = AsyncData(Right(result));
    return result;
  }

  Future<Either<Failure, List<PermissionType>>> getDeniedPermissions() async {
    final result = await ref
        .read(permissionUsecaseProvider)
        .getDeniedPermissions();
    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (voiData) => AsyncData(Left(voiData)),
    );
    return result;
  }

  Future<bool> isAllPermissionsGranted() async {
    final result = await ref
        .read(permissionUsecaseProvider)
        .isAllPermissionsGranted();
    state = AsyncData(Right(result));
    return result;
  }
}
