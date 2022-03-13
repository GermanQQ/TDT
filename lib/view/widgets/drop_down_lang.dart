import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tdt/core/constants/constans.dart';
import 'package:flutter_tdt/core/providers/language_provider.dart';

import '../../core/utils/utils.dart';

class DropDownLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: context.locale,
          dropdownColor: bgColor,
          icon: RotatedBox(quarterTurns: 3, child: Icon(Icons.arrow_back_ios_new, color: Colors.black)),
          onChanged: (value) {},
          items: LanguageProvider.supportedLocales
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      languageName(e.languageCode),
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  onTap: () {
                    context.setLocale(e);
                  }))
              .toList()),
    );
  }
}
