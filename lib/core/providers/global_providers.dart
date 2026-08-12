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
ApiUrl nodeApiUrl(Ref ref) {
  const nodeIp = String.fromEnvironment('NodeIp');
  const mainIp = String.fromEnvironment('Ip', defaultValue: remoteUrl);
  const addPorts = bool.fromEnvironment('isLocal', defaultValue: usePorts);
  String baseUrl = nodeIp.isEmptyOrNull ? mainIp : nodeIp;

  return ApiUrl(
    remoteBase: addPorts ? "http://$baseUrl:3000/api/v1" : "$baseUrl/api/v1",
  );
}

@riverpod
ApiUrl phpApiUrl(Ref ref) {
  const phpIp = String.fromEnvironment('PHPIp');
  const mainIp = String.fromEnvironment('Ip', defaultValue: remoteUrl);
  const addPorts = bool.fromEnvironment('isLocal', defaultValue: usePorts);
  String baseUrl = phpIp.isEmptyOrNull ? mainIp : phpIp;

  return ApiUrl(
    remoteBase: addPorts ? "http://$baseUrl:8000/api/v1" : "$baseUrl/api/v1",
  );
}
