import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/services/language_service.dart';

import '../../core/domain/utils/utils.dart';

class DropDownLang extends StatelessWidget {
  const DropDownLang({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: context.locale,
          dropdownColor: bgColor,
          icon: const RotatedBox(quarterTurns: 3, child: Icon(Icons.arrow_back_ios_new, color: Colors.black)),
          onChanged: (value) {},
          items: LanguageService.supportedLocales
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
