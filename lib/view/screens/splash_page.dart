import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

class SplashPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.splash,
      key: ValueKey(Routes.splash),
      child: const SplashPage(),
    );
  }

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SlpashWidget(),
    );
  }
}
