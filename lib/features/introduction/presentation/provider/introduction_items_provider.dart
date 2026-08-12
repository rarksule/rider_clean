import 'package:nb_utils/nb_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/providers/global_providers.dart';

part 'introduction_items_provider.g.dart';

@riverpod
List<WalkThroughModelClass> introductionItems(Ref ref) {
  final language = ref.watch(languageProvider);
  return [
    WalkThroughModelClass(
      title: language.walkThrough1Title,
      subTitle: language.walkThrough1Subtitle,
      image: walk1,
    ),
    WalkThroughModelClass(
      title: language.walkThrough2Title,
      subTitle: language.walkThrough2Subtitle,
      image: walk2,
    ),
    WalkThroughModelClass(
      title: language.walkThrough3Title,
      subTitle: language.walkThrough3Subtitle,
      image: walk3,
    ),
  ];
}
