import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../providers/global_providers.dart';
// import '../routing/route_provider.dart';
import '../localizations/app_localizations.dart';
import '../theme/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref
        .watch(languageProvider.notifier)
        .selectedLanguage;
    // final themeMode = ref.watch(themeProvider);
    // final router = ref.watch(routerProvider);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Rider App',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,// themeMode,
      darkTheme: AppTheme.darkTheme,
      supportedLocales: LanguageDataModel.languageLocales(),
      localizationsDelegates: const [
        AppLocalizations(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) => locale,
      locale: Locale(selectedLanguage),
      home:SplashScreen()
    );
  }
}
