import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'core/app/my_app.dart';
import 'core/constants/constants.dart';
import 'core/localizations/app_localizations.dart';
import 'core/providers/global_providers.dart';
import 'firebase_options.dart';

// WidgetsFlutterBinding.ensureInitialized();

// runApp(const MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initialize(aLocaleLanguageList: languageList);
  
  
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  

  FirebaseMessaging.instance.onTokenRefresh
      .listen((fcmToken) {
        // TODO: If necessary send token to application server.
        log("\n\n fcm refreshed Token $fcmToken\n\n");
        // Note: This callback is fired at each app startup and whenever a new
        // token is generated.
      })
      .onError((err) {
        // Error getting token.
      });

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
