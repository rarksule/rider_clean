// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'introduction_items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(introductionItems)
final introductionItemsProvider = IntroductionItemsProvider._();

final class IntroductionItemsProvider
    extends
        $FunctionalProvider<
          List<WalkThroughModelClass>,
          List<WalkThroughModelClass>,
          List<WalkThroughModelClass>
        >
    with $Provider<List<WalkThroughModelClass>> {
  IntroductionItemsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'introductionItemsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$introductionItemsHash();

  @$internal
  @override
  $ProviderElement<List<WalkThroughModelClass>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<WalkThroughModelClass> create(Ref ref) {
    return introductionItems(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<WalkThroughModelClass> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<WalkThroughModelClass>>(value),
    );
  }
}

String _$introductionItemsHash() => r'bbafdc300152795848667e7375b578852f07afa7';
