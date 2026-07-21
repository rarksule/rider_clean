import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'core/app/my_app.dart';
import 'core/constants/constants.dart';
import 'core/localizations/app_localizations.dart';
import 'core/providers/global_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize(aLocaleLanguageList: languageList);

  runApp(
    ProviderScope(
      overrides: [
        languageProvider.overrideWith(() {
          final notifier = Language();
          notifier.setLanguage(getStringAsync(selectedLanguage));
          return notifier;
        }),
      ],
      child: const MyApp(),
    ),
  );
}
