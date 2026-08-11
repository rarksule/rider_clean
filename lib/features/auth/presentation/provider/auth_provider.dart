import '../../../../core/providers/global_providers.dart';
import '../../../../features/auth/domain/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasource/auth_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entity/auth_session.dart';
import '../../domain/entity/login_result.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/usecases/auth_usecase.dart';

part 'auth_provider.g.dart';

@riverpod
AuthDataSource authDataSource(Ref ref) {
  return AuthDataSource(
    ref.read(nodeApiUrlProvider),
    ref.read(phpApiUrlProvider),
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

  Future<void> sendOtp(String phone) async {
    state = const AsyncLoading();

    final result = await ref.read(authUsecaseProvider).sendOtp(phone);

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

  Future<void> verify({
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

  Future<void> get() async {
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

  Future<void> register({
    required String address,
    required String name,
    required String email,
    required String phone,
  }) async {
    state = const AsyncLoading();

    final result = await ref
        .read(authUsecaseProvider)
        .registerUser(address:address, phone:phone, name:name, email:email);

    state = result.fold(
      (failure) => AsyncError(failure.message, StackTrace.current),
      (data) => AsyncData(data),
    );
  }
}

// @riverpod
// class Auth extends _$Auth {
//   late final AuthUsecase usecase;

//   @override
//   Future<void> build() async {
//     usecase = ref.read(authUsecaseProvider);
//     return;
//   }

//   Future<void> sendOtp(String phoneNumber) async {
//     state = const AsyncLoading();
//     try {
//       await usecase.sendOtp(phoneNumber);
//       state = const AsyncData(null);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   Future<LoginResult?> login(String phoneNumber, String otp) async {
//     state = const AsyncLoading();
//     try {
//       final loginResult = await usecase.login(phoneNumber, otp);
//       state = AsyncData(loginResult);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   Future<void> register(UserData userData, String name, String email) async {
//     state = const AsyncLoading();
//     try {
//       await usecase.registerUser(userData, name, email);
//       state = const AsyncData(null);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }
// }
