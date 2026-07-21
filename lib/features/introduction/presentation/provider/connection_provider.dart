import 'package:nb_utils/nb_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'connection_provider.g.dart';

@riverpod
Stream<bool> hasInternet(Ref ref) async* {
  final connectivity = Connectivity();

  await for (final results in connectivity.onConnectivityChanged) {
    final noInternet = results.any((e) => e == ConnectivityResult.none);
    yield !noInternet;
  }
}
