import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/core/network/api_classes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../constants/constants.dart';
import '../localizations/app_language.dart';
import '../localizations/app_localizations.dart';
import '../localizations/language_en.dart';

part 'global_providers.g.dart';

@Riverpod(keepAlive: true)
class Language extends _$Language {
  String _selectedLanguage = defaultLanguage;
  @override
  AppLanguage build() {
    return LanguageEn();
  }

  String get selectedLanguage => _selectedLanguage;

  Future<void> setLanguage(String aCode) async {
    _selectedLanguage = aCode.validate(value: defaultLanguage);
    state = await const AppLocalizations().load(Locale(_selectedLanguage));
  }
}

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void toggleTheme(ThemeMode mode) {
    state = mode;
  }
}

@riverpod
Map<String, dynamic> ips(Ref ref) {
  const String nodeIp = String.fromEnvironment('NodeIp');
  const String phpIp = String.fromEnvironment('PHPIp');
  const String mainIp = String.fromEnvironment('Ip');
  const bool local = bool.fromEnvironment('isLocal', defaultValue: isLocal);

  return {
    "nodeIp": nodeurl ?? nodeIp,
    "phpIp": phpurl ?? phpIp,
    "mainIp": mainIp.isEmpty ? remoteUrl : mainIp,
    "local": local,
  };
}

@riverpod
ApiUrl nodeApiUrl(Ref ref) {
  var provider = ref.watch(ipsProvider);
  String nodeIp = provider['nodeIp'];
  String mainIp = provider['mainIp'];
  bool isLocal = provider["local"];
  String baseUrl = nodeIp.isEmptyOrNull ? mainIp : nodeIp;

  return ApiUrl(remoteBase: isLocal ? "$baseUrl:3000/api/v1" : "$baseUrl/api/v1");
}

@riverpod
ApiUrl phpApiUrl(Ref ref) {
  var provider = ref.watch(ipsProvider);
  String phpIp = provider['phpIp'];
  String mainIp = provider['mainIp'];
  bool isLocal = provider["local"];
  String baseUrl = phpIp.isEmptyOrNull ? mainIp : phpIp;

  return ApiUrl(remoteBase: isLocal ? "$baseUrl:1000/api/v1" : "$baseUrl/api/v1");
}
