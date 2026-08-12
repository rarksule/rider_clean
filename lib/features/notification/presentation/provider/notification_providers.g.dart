// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationDatasource)
final notificationDatasourceProvider = NotificationDatasourceProvider._();

final class NotificationDatasourceProvider
    extends
        $FunctionalProvider<
          NotificationDatasource,
          NotificationDatasource,
          NotificationDatasource
        >
    with $Provider<NotificationDatasource> {
  NotificationDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationDatasourceHash();

  @$internal
  @override
  $ProviderElement<NotificationDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationDatasource create(Ref ref) {
    return notificationDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationDatasource>(value),
    );
  }
}

String _$notificationDatasourceHash() =>
    r'9239d28cc27d03f1b5b160821d24c08829cb7d3a';

@ProviderFor(notificationRepository)
final notificationRepositoryProvider = NotificationRepositoryProvider._();

final class NotificationRepositoryProvider
    extends
        $FunctionalProvider<
          NotificationRepository,
          NotificationRepository,
          NotificationRepository
        >
    with $Provider<NotificationRepository> {
  NotificationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationRepositoryHash();

  @$internal
  @override
  $ProviderElement<NotificationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotificationRepository create(Ref ref) {
    return notificationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationRepository>(value),
    );
  }
}

String _$notificationRepositoryHash() =>
    r'92c7a5736cd11915aacbbd134b7e36121f7dd35b';

@ProviderFor(notifcationUsecase)
final notifcationUsecaseProvider = NotifcationUsecaseProvider._();

final class NotifcationUsecaseProvider
    extends
        $FunctionalProvider<
          NotifcationUsecase,
          NotifcationUsecase,
          NotifcationUsecase
        >
    with $Provider<NotifcationUsecase> {
  NotifcationUsecaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notifcationUsecaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notifcationUsecaseHash();

  @$internal
  @override
  $ProviderElement<NotifcationUsecase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NotifcationUsecase create(Ref ref) {
    return notifcationUsecase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotifcationUsecase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotifcationUsecase>(value),
    );
  }
}

String _$notifcationUsecaseHash() =>
    r'559add04e6fd66a64f53d3af81092ffdb754cc95';

@ProviderFor(Notifcation)
final notifcationProvider = NotifcationProvider._();

final class NotifcationProvider
    extends $AsyncNotifierProvider<Notifcation, String?> {
  NotifcationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notifcationProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notifcationHash();

  @$internal
  @override
  Notifcation create() => Notifcation();
}

String _$notifcationHash() => r'4c509732a4500119532f399e77c00e42a78e2108';

abstract class _$Notifcation extends $AsyncNotifier<String?> {
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
