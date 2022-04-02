import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/locator.dart';

class PoolExpertPage extends StatelessWidget {
  const PoolExpertPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
          child: IconButton(
        onPressed: () {
          locator<AuthService>().signOut();
        },
        icon: const Icon(Icons.logout),
      )),
    );
  }
}
