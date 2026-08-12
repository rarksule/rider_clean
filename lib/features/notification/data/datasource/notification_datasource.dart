import 'package:dartz/dartz.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/error/failures.dart';

class NotificationDatasource {
  Future<Either<Failure, String>> getToken() async {
    String fcmToken = await FirebaseMessaging.instance.getToken() ?? '';
    if (fcmToken.isNotEmpty && getStringAsync(fcmTokenKey) != fcmToken) {
      setValue(fcmTokenKey, fcmToken);
    }
    return Right("_r");
  }
}
