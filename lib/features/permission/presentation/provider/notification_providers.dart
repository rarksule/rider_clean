import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/constants/constants.dart';

part 'notification_providers.g.dart';

// final

@Riverpod(keepAlive: true)
class Notifcation extends _$Notifcation {
  @override
  FutureOr<bool> build() {
    return false;
  }

  Future<void> requestPermission() async {
    await FirebaseMessaging.instance.requestPermission(provisional: true);
  }

  Future<void> getToken() async {
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    if (fcmToken.isNotEmpty && getStringAsync(fcmTokenKey) != fcmToken) {
      setValue(fcmTokenKey, fcmToken);
    }
  }
}
