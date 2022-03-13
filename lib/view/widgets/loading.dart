import 'package:flutter/material.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

import 'package:easy_localization/easy_localization.dart';

class InfinityZoomImage extends StatefulWidget {
  @override
  _InfinityZoomImageState createState() => _InfinityZoomImageState();
}

class _InfinityZoomImageState extends State<InfinityZoomImage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _sizeAnimation;

  bool reverse = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _animationController.repeat(reverse: !reverse);
              reverse = !reverse;
            }
          });

    _sizeAnimation =
        Tween<double>(begin: 150.0, end: 144.0).animate(_animationController);
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            child: AnimatedBuilder(
                animation: _sizeAnimation,
                builder: (context, child) => LogoImage(
                    width: _sizeAnimation.value + 30,
                    height: _sizeAnimation.value)),
          ),
          Text('loading'.tr()),
        ],
      ),
    );
  }
}
