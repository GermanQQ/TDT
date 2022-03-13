import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/locator.dart';

import '../../core/constants/routes.dart';

class CoursesPage extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.courses,
      key: ValueKey(Routes.courses),
      child: const CoursesPage(),
    );
  }

  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
        onPressed: () {
          locator<AuthProvider>().signOut();
        },
        icon: Icon(Icons.logout),
      )),
    );
  }
}
