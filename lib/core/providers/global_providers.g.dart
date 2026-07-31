// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Language)
final languageProvider = LanguageProvider._();

final class LanguageProvider extends $NotifierProvider<Language, AppLanguage> {
  LanguageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageHash();

  @$internal
  @override
  Language create() => Language();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLanguage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLanguage>(value),
    );
  }
}

String _$languageHash() => r'f643c00e3e66f4067b95822d6420f8b9e0a7ea03';

abstract class _$Language extends $Notifier<AppLanguage> {
  AppLanguage build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppLanguage, AppLanguage>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppLanguage, AppLanguage>,
              AppLanguage,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(Theme)
final themeProvider = ThemeProvider._();

final class ThemeProvider extends $NotifierProvider<Theme, ThemeMode> {
  ThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeHash();

  @$internal
  @override
  Theme create() => Theme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeHash() => r'fc0d3d3adbd00a97bcf61df7a96e0f9b04849839';

abstract class _$Theme extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(ips)
final ipsProvider = IpsProvider._();

final class IpsProvider
    extends
        $FunctionalProvider<
          Map<String, dynamic>,
          Map<String, dynamic>,
          Map<String, dynamic>
        >
    with $Provider<Map<String, dynamic>> {
  IpsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ipsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ipsHash();

  @$internal
  @override
  $ProviderElement<Map<String, dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<String, dynamic> create(Ref ref) {
    return ips(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, dynamic>>(value),
    );
  }
}

String _$ipsHash() => r'911667368eb53c65fd33943fb0f8795e779a3829';

@ProviderFor(nodeApiUrl)
final nodeApiUrlProvider = NodeApiUrlProvider._();

final class NodeApiUrlProvider
    extends $FunctionalProvider<ApiUrl, ApiUrl, ApiUrl>
    with $Provider<ApiUrl> {
  NodeApiUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nodeApiUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nodeApiUrlHash();

  @$internal
  @override
  $ProviderElement<ApiUrl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiUrl create(Ref ref) {
    return nodeApiUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiUrl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiUrl>(value),
    );
  }
}

String _$nodeApiUrlHash() => r'95af22acbef1058207159a8ca749b71c70f0e33a';

@ProviderFor(phpApiUrl)
final phpApiUrlProvider = PhpApiUrlProvider._();

final class PhpApiUrlProvider
    extends $FunctionalProvider<ApiUrl, ApiUrl, ApiUrl>
    with $Provider<ApiUrl> {
  PhpApiUrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'phpApiUrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$phpApiUrlHash();

  @$internal
  @override
  $ProviderElement<ApiUrl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiUrl create(Ref ref) {
    return phpApiUrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiUrl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiUrl>(value),
    );
  }
}

String _$phpApiUrlHash() => r'4dc1435acf71e364406e462040bbf20e42fa6e5c';
