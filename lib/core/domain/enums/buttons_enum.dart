import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/colors.dart';
import 'package:flutter_tdt/view/widgets/buttons.dart';

abstract class BaseButton {
  Widget create({
    required String title,
    required VoidCallback onTap,
    Size? size,
  });

  factory BaseButton(ButtonType type){
     switch (type) {
       case ButtonType.white:
         return WhiteButton();
       case ButtonType.blue:
         return BlueButton();
       default:
         return BlueButton();
     }
  }

}

class WhiteButton implements BaseButton{
  @override
  Widget create({required String title, required VoidCallback onTap, Size? size}) {
    return CustomButton(title: title, type: ButtonType.white, onPressed: onTap);
  }
 
 

}
class BlueButton implements BaseButton{
  @override
  Widget create({required String title, required VoidCallback onTap, Size? size}) {
   return CustomButton(title: title, type: ButtonType.blue, onPressed: onTap);
  }


}


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
