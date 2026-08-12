// features/splash/data/datasources/splash_local_datasource.dart
// import 'package:nb_utils/nb_utils.dart';
// import '../../../../core/constants/constants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/constants/constants.dart';

class SplashLocalDatasource {
  bool get isFirstTime => getBoolAsync(isFirstTimeKey, defaultValue: true);

  bool get isLoggedIn => getBoolAsync(isLoggedInKey);

  String get getUserId => getStringAsync(userIdkey);
}
