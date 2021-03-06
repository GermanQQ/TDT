import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final ButtonType type;

 const CustomButton({Key? key, 
    required this.title,
    this.onPressed,
    this.width = double.infinity,
    this.height = 59,
    this.type = ButtonType.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: accentColor)),
      child: MaterialButton(
        elevation: 0,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: type.color,
        splashColor: type.color.withOpacity(0.8),
        disabledColor: const Color(0xFF8796AD),
        highlightColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          child: Center(
            child: Text(
              title,
              style: type == ButtonType.white
                  ? Theme.of(context).textTheme.headline4
                  : TDTTheme.darkTextTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class SkipButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SkipButton({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5, bottom: 5),
      child: MaterialButton(
        elevation: 0.4,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        splashColor: Colors.transparent,
        disabledColor: const Color(0xFF8796AD),
        highlightColor: Colors.transparent,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Center(
            child: Text(
              'skip',
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBackBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  const CustomBackBtn({this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
      child: MaterialButton(
        elevation: 0.4,
        onPressed: onPressed ?? () => Navigator.pop(context),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.white,
        splashColor: Colors.transparent,
        disabledColor: const Color(0xFF8796AD),
        highlightColor: Colors.transparent,
        child: const Icon(Icons.arrow_back_ios),
      ),
    );
  }
}

class SendBtn extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  const SendBtn({this.onPressed, this.size = 40.0});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
                color: accentColor, borderRadius: BorderRadius.circular(50)),
          ),
          const Icon(Icons.arrow_upward, color: Colors.white)
        ],
      ),
    );
  }
}
