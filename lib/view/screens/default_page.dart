import 'package:flutter/material.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

class DefaultPage extends StatelessWidget {
  final Widget body;
  final bool showBottomBar;
  const DefaultPage({Key? key, required this.body, this.showBottomBar = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: showBottomBar ? const CustomBottomBar() : null,
    );
  }
}