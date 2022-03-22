import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/language_model.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageInitialPage extends StatelessWidget {
  const LanguageInitialPage({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.initialLang,
      key: ValueKey(Routes.initialLang),
      child: LanguageInitialPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const LogoImage(),
           const SizedBox(height: 50),
           const DropDownLang(),
           const SizedBox(height: 10),
          Text('selectLang',
                style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LanguageModel>().setLang(context.locale);
        },
        child: Icon(Icons.arrow_right_alt, size: 40),
      ),
    );
  }
}
