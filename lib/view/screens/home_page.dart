import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/view/screens/sreens.dart';
import 'package:provider/provider.dart';

import 'default_Page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.home,
      key: ValueKey(Routes.home),
      child: HomeScreen(),
    );
  }

  static const _pages = [PoolExpertPage(), CoursesPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return DefaultPage(
      body: _pages[context.watch<Routes>().currentIndex],
    );
  }
}
