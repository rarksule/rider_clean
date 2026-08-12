// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authDataSource)
final authDataSourceProvider = AuthDataSourceProvider._();

final class AuthDataSourceProvider
    extends $FunctionalProvider<AuthDataSource, AuthDataSource, AuthDataSource>
    with $Provider<AuthDataSource> {
  AuthDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthDataSource create(Ref ref) {
    return authDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthDataSource>(value),
    );
  }
}

String _$authDataSourceHash() => r'c3aea35aa2516b371870c34d9befd6410507e770';

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'75686644d8a737091980eccbf080c8606a609826';

@ProviderFor(authUsecase)
final authUsecaseProvider = AuthUsecaseProvider._();

final class AuthUsecaseProvider
    extends $FunctionalProvider<AuthUsecase, AuthUsecase, AuthUsecase>
    with $Provider<AuthUsecase> {
  AuthUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authUsecaseHash();

  @$internal
  @override
  $ProviderElement<AuthUsecase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthUsecase create(Ref ref) {
    return authUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthUsecase>(value),
    );
  }
}

String _$authUsecaseHash() => r'3bc418dad6a0aa945166013031566762f3e8e991';

@ProviderFor(SendOtpFlow)
final sendOtpFlowProvider = SendOtpFlowProvider._();

final class SendOtpFlowProvider
    extends $AsyncNotifierProvider<SendOtpFlow, String> {
  SendOtpFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendOtpFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendOtpFlowHash();

  @$internal
  @override
  SendOtpFlow create() => SendOtpFlow();
}

String _$sendOtpFlowHash() => r'50711532de0755c8d07396fb1d49fa4175efcc7b';

abstract class _$SendOtpFlow extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String>, String>,
              AsyncValue<String>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(GetAppSettings)
final getAppSettingsProvider = GetAppSettingsProvider._();

final class GetAppSettingsProvider
    extends $AsyncNotifierProvider<GetAppSettings, Map<String, dynamic>> {
  GetAppSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAppSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAppSettingsHash();

  @$internal
  @override
  GetAppSettings create() => GetAppSettings();
}

String _$getAppSettingsHash() => r'15b4e8f4c16f9d01fcf252f4d434fa7f1db73c14';

abstract class _$GetAppSettings extends $AsyncNotifier<Map<String, dynamic>> {
  FutureOr<Map<String, dynamic>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<Map<String, dynamic>>, Map<String, dynamic>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, dynamic>>,
                Map<String, dynamic>
              >,
              AsyncValue<Map<String, dynamic>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(VerifyOtpFlow)
final verifyOtpFlowProvider = VerifyOtpFlowProvider._();

final class VerifyOtpFlowProvider
    extends $AsyncNotifierProvider<VerifyOtpFlow, LoginResult?> {
  VerifyOtpFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'verifyOtpFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$verifyOtpFlowHash();

  @$internal
  @override
  VerifyOtpFlow create() => VerifyOtpFlow();
}

String _$verifyOtpFlowHash() => r'36faf766091f4f189210b1215ea73a893a2fb65d';

abstract class _$VerifyOtpFlow extends $AsyncNotifier<LoginResult?> {
  FutureOr<LoginResult?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<LoginResult?>, LoginResult?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LoginResult?>, LoginResult?>,
              AsyncValue<LoginResult?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(GetJWTFlow)
final getJWTFlowProvider = GetJWTFlowProvider._();

final class GetJWTFlowProvider
    extends $AsyncNotifierProvider<GetJWTFlow, AuthSession?> {
  GetJWTFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getJWTFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getJWTFlowHash();

  @$internal
  @override
  GetJWTFlow create() => GetJWTFlow();
}

String _$getJWTFlowHash() => r'7832eaa0d62f8861c3dd8d57b192e634201ef1e5';

abstract class _$GetJWTFlow extends $AsyncNotifier<AuthSession?> {
  FutureOr<AuthSession?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<AuthSession?>, AuthSession?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AuthSession?>, AuthSession?>,
              AsyncValue<AuthSession?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(RegisterFlow)
final registerFlowProvider = RegisterFlowProvider._();

final class RegisterFlowProvider
    extends $AsyncNotifierProvider<RegisterFlow, String?> {
  RegisterFlowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerFlowProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerFlowHash();

  @$internal
  @override
  RegisterFlow create() => RegisterFlow();
}

String _$registerFlowHash() => r'fb4d0cb2e177e6deebfb4b1b28ea74b5641e2bbe';

abstract class _$RegisterFlow extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
