import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/providers/global_providers.dart';
import '../../../auth/presentation/screens/signin_screen.dart';
import '../provider/introduction_items_provider.dart';

class IntroductionScreen extends ConsumerStatefulWidget {
  const IntroductionScreen({super.key});

  @override
  ConsumerState<IntroductionScreen> createState() => IntroductionScreenState();
}

class IntroductionScreenState extends ConsumerState<IntroductionScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // init();
    Future.microtask(() => init());
  }

  @override
  Widget build(BuildContext context) {
    final pages = ref.watch(introductionItemsProvider);
    final language = ref.watch(languageProvider);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
            controller: pageController,
            itemBuilder: (context, i) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    pages[i].image.toString(),
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  Positioned(
                    bottom: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          pages[i].title!,
                          style: boldTextStyle(size: 30, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          pages[i].subTitle.toString(),
                          style: secondaryTextStyle(
                            size: 14,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            onPageChanged: (int i) {
              currentPage = i;
              setState(() {});
            },
          ),
          Positioned(
            bottom: 10,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pages.length, (ind) {
                      return Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: currentPage == ind
                              ? Colors.white
                              : Colors.grey.withAlpha(127),
                          borderRadius: BorderRadius.circular(defaultRadius),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    if (currentPage.toInt() >= 2) {
                      const SignInScreen().launch(context, isNewTask: true);
                      setValue(isFirstTimeKey, false);
                    } else {
                      pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linearToEaseOut,
                      );
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 0,
            child: TextButton(
              onPressed: () {
                const SignInScreen().launch(context, isNewTask: true);
                setValue(isFirstTimeKey, false);
              },
              child: Text(
                language.skip,
                style: boldTextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void init() async{
  //  await Future.delayed(Duration(milliseconds: 10));
    final languagenotifier = ref.read(languageProvider.notifier);
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultRadius),
        ),
      ),
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, _) {
            final language = ref.read(languageProvider);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: primaryColor.withAlpha(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(language.selectLanguage, style: boldTextStyle()),
                    ],
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: localeLanguageList.length,
                  itemBuilder: (context, index) {
                    LanguageDataModel mData = localeLanguageList[index];
                    return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  mData.name.validate(),
                                  style: boldTextStyle(),
                                ),
                                8.height,
                                Text(
                                  mData.subTitle.validate(),
                                  style: secondaryTextStyle(),
                                ),
                              ],
                            ),
                            if (getStringAsync(
                                  selectedLanguage,
                                  defaultValue: defaultLanguage,
                                ) ==
                                mData.languageCode)
                              const Icon(
                                Icons.check_circle,
                                color: primaryColor,
                              ),
                          ],
                        )
                        .onTap(() async {
                          final languageCode = mData.languageCode.validate();
                          await setValue(selectedLanguage, languageCode);
                          await languagenotifier.setLanguage(languageCode);
                          finish(getContext);
                        })
                        .paddingSymmetric(vertical: 2, horizontal: 16);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                ).expand(),
              ],
            );
          },
        );
      },
    );
  }
}
