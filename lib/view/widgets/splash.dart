import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget();
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;

  bool reverse = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat(reverse: !reverse);
          reverse = !reverse;
        }
      });

    _sizeAnimation =
        Tween<double>(begin: 50.0, end: 53.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _sizeAnimation,
        builder: (context, child) => Stack(
          alignment: AlignmentDirectional.center,
          children: [
            LogoImage(
                width: _sizeAnimation.value, height: _sizeAnimation.value),
            SizedBox(
              width: _sizeAnimation.value + 35,
              height: _sizeAnimation.value + 35,
              child: const CircularProgressIndicator(
                color: Colors.yellow,
                backgroundColor: accentColor,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
