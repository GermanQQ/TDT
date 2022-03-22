import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_tdt/locator.dart';


class ProfilePage extends StatelessWidget {
 const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
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
