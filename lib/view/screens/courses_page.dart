import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/locator.dart';


class CoursesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
        child: IconButton(
      onPressed: () {
        locator<AuthProvider>().signOut();
      },
      icon: Icon(Icons.logout),
    ));
  }
}
