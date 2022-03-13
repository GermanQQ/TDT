import 'package:flutter/material.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

import '../../core/constants/constans.dart';

class InitialPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.initialLoading,
      key: ValueKey(Routes.initialLoading),
      child: const InitialPage(),
    );
  }

  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InfinityZoomImage(),
    );
  }
}
