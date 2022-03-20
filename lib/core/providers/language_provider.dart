import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/providers/base_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends BaseProvider {
  static List<Locale> supportedLocales = [
    const Locale.fromSubtags(languageCode: 'en'),
    const Locale.fromSubtags(languageCode: 'ru'),
    const Locale.fromSubtags(languageCode: 'es'),
  ];

  static Locale? lang;

  void setLang(Locale locale) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('langCode', locale.languageCode);
    lang = locale;
    notifyListeners();
  }

  static localize(Widget app) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? langCode = pref.getString('langCode');
    if (langCode != null) lang = Locale.fromSubtags(languageCode: langCode);
    
    return EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/locale',
        useOnlyLangCode: true,
        startLocale: lang ?? supportedLocales[0],
        fallbackLocale: lang ?? supportedLocales[0],
        child: app);
  }
}
