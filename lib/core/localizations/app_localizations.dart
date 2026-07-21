import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'app_language.dart';
import 'language_am.dart';
import 'language_om.dart';
import 'language_so.dart';
import 'language_en.dart';

class AppLocalizations extends LocalizationsDelegate<AppLanguage> {
  const AppLocalizations();

  @override
  Future<AppLanguage> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return LanguageEn();
      case 'am':
        return LanguageAm();
      case 'or':
        return LanguageOm();
      case 'so':
        return LanguageSo();
      default:
        return LanguageEn();
    }
  }

  @override
  bool isSupported(Locale locale) =>
      LanguageDataModel.languages().contains(locale.languageCode);

  @override
  bool shouldReload(LocalizationsDelegate<AppLanguage> old) => false;
}

List<LanguageDataModel> languageList = [
  LanguageDataModel(
    id: 1,
    name: 'English',
    subTitle: 'English',
    languageCode: 'en',
    fullLanguageCode: 'en-US',
  ),
  LanguageDataModel(
    id: 4,
    name: 'Amharic',
    subTitle: 'አማርኛ',
    languageCode: 'am',
    fullLanguageCode: 'am-ET',
  ),
  LanguageDataModel(
    id: 5,
    name: 'Oromo',
    subTitle: 'Oromiffa',
    languageCode: 'or',
    fullLanguageCode: 'or-ET',
  ),
  LanguageDataModel(
    id: 6,
    name: 'Somali',
    subTitle: 'Af-Somali',
    languageCode: 'so',
    fullLanguageCode: 'so-ET',
  ),
];
