import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';

ScaffoldFeatureController showSnackBar(
  BuildContext context, {
  required String text,
  Color color = redColor,
  Duration duration = const Duration(seconds: 3),
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TDTTheme.darkTextTheme.headline3,
      ),
      duration: duration,
    ),
  );
}
