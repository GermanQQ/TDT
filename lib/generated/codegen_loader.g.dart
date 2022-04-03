// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ru = {
  "selectLang": "выберите язык приложения",
  "loading": "Загрузка..."
};
static const Map<String,dynamic> uk = {
  "selectLang": "seleccione el idioma de la aplicación",
  "loading": "Cargando..."
};
static const Map<String,dynamic> en = {
  "selectLang": "select application language",
  "loading": "Loading..."
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": ru, "uk": uk, "en": en};
}
