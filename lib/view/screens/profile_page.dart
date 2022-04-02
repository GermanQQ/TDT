import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/locator.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
        children: [
          Text(locator<AuthService>().user?.name ?? 'none', style: Theme.of(context).textTheme.headline3),
          Text(locator<AuthService>().user?.email ?? 'none', style: Theme.of(context).textTheme.headline3),
          IconButton(
            onPressed: () {
              locator<AuthService>().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      )),
    );
  }
}
