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

String _$authDataSourceHash() => r'8832687b24047c59a4fff480975fb7a5ac32e85a';

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

String _$sendOtpFlowHash() => r'86fb54ccd4617422d44cb74369e8e72de75e3df6';

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

String _$verifyOtpFlowHash() => r'97f10f127defd00b74ca83cabc9e9bd52f70af56';

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

@ProviderFor(RegisterFlow)
final registerFlowProvider = RegisterFlowProvider._();

final class RegisterFlowProvider
    extends $AsyncNotifierProvider<RegisterFlow, void> {
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

String _$registerFlowHash() => r'bc2e75925c7c8ceb55d1390627b555bd66719cef';

abstract class _$RegisterFlow extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
