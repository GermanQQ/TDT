import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/locator.dart';


class PoolExpertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
          child: IconButton(
        onPressed: () {
          locator<AuthProvider>().signOut();
        },
        icon: Icon(Icons.logout),
      )),
    );
  }
}
