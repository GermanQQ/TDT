import 'package:flutter/material.dart';
class LogoImage extends StatelessWidget {
  final double width;
  final double height;
  const LogoImage({this.width = 50, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: const AssetImage('assets/icons/logo.png'),
    );
  }
}
