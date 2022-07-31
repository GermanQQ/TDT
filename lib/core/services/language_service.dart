import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const defautlLang = Locale.fromSubtags(languageCode: 'en');

  static const List<Locale> supportedLocales = [
    Locale.fromSubtags(languageCode: 'uk'),
    defautlLang,
    Locale.fromSubtags(languageCode: 'ru'),
  ];

  static Locale? lang;

  static void setLang(Locale locale) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('langCode', locale.languageCode);
    lang = locale;
    //when should to update route
    locator<Routes>().refresh();
  }

  static localize(Widget app) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? langCode = pref.getString('langCode');
    if (langCode != null) lang = Locale.fromSubtags(languageCode: langCode);

    return EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/locale',
        useOnlyLangCode: true,
        startLocale: lang ?? defautlLang,
        fallbackLocale: lang ?? defautlLang,
        child: app);
  }
}
