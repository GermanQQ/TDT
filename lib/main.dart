import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/services/language_service.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:flutter_tdt/view/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(await LanguageService.localize(MyApp.create()));
}