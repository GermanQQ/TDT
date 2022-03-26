import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/colors.dart';

enum ButtonType { white, blue }

extension ButtonExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.white:
        return Colors.white;
      case ButtonType.blue:
        return accentColor;
      default:
        return Colors.transparent;
    }
  }
}
