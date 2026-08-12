import '../../../../core/providers/global_providers.dart';
import '../../../../features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/auth_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entity/auth_session.dart';
import '../../domain/entity/login_result.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_provider.g.dart';

@riverpod
AuthDataSource authDataSource(Ref ref) {
  return AuthDataSource(
    nodeUrl: ref.read(nodeApiUrlProvider),
    phpUrl: ref.read(phpApiUrlProvider),
  );
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(authDataSource: ref.read(authDataSourceProvider));
}

@riverpod
AuthUsecase authUsecase(Ref ref) {
  return AuthUsecase(ref.read(authRepositoryProvider));
}

@riverpod
class SendOtpFlow extends _$SendOtpFlow {
  @override
  FutureOr<String> build() => '';

  Future<void> call(String phone) async {
    state = const AsyncLoading();

    final result = await ref.read(authUsecaseProvider).sendOtp(phone);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (voiData) => AsyncData(voiData),
    );
  }
}

@riverpod
class GetAppSettings extends _$GetAppSettings {
  @override
  FutureOr<Map<String, dynamic>> build() => {};

  Future<void> call() async {
    state = AsyncLoading();
    final result = await ref.read(authUsecaseProvider).getAppSettings();

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (voiData) => AsyncData(voiData),
    );
  }
}

@riverpod
class VerifyOtpFlow extends _$VerifyOtpFlow {
  @override
  FutureOr<LoginResult?> build() => null;

  Future<void> call({
    required String phoneNumber,
    required String otp,
    required String otpId,
  }) async {
    state = const AsyncLoading();

    final result = await ref
        .read(authUsecaseProvider)
        .login(phoneNumber: phoneNumber, otp: otp, otpId: otpId);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

@riverpod
class GetJWTFlow extends _$GetJWTFlow {
  @override
  FutureOr<AuthSession?> build() => null;

  Future<void> call() async {
    state = const AsyncLoading();

    final result = await ref.read(authUsecaseProvider).getJwt();

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

@riverpod
class RegisterFlow extends _$RegisterFlow {
  @override
  FutureOr<String?> build() => null;

  Future<void> call({
    required String address,
    required String name,
    required String email,
    required String phone,
  }) async {
    state = const AsyncLoading();

    final result = await ref
        .read(authUsecaseProvider)
        .registerUser(address: address, phone: phone, name: name, email: email);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}
