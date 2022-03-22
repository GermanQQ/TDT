import 'package:flutter/material.dart';
class LogoImage extends StatelessWidget {
  final double width;
  final double height;
  const LogoImage({this.width = 180, this.height = 95});

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: AssetImage('assets/images/bg-logo.png'),
    );
  }
}
