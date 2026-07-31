// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Notifcation)
final notifcationProvider = NotifcationProvider._();

final class NotifcationProvider
    extends $AsyncNotifierProvider<Notifcation, bool> {
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

String _$notifcationHash() => r'b0286e229dffee28e430b587a25caf4a16fa35f8';

abstract class _$Notifcation extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
