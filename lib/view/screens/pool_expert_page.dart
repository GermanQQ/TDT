import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
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
          locator<AuthModel>().signOut();
        },
        icon: Icon(Icons.logout),
      )),
    );
  }
}
