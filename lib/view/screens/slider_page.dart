import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/slider_view.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);
 
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.sliderPage,
      key: ValueKey(Routes.sliderPage),
      child: const SliderPage(),
    );
  }

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final CarouselController _buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderView(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Builder(
                builder: (context) => SkipButton(
                      onPressed: () => _buttonCarouselController.nextPage(
                          duration: const Duration(milliseconds: 300), curve: Curves.linear),
                    ))
          ],
        ),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomSlider(controller: _buttonCarouselController),
                    const SizedBox(height: 20),
                    CustomButton(title: 'Register', onPressed: () => locator<Routes>().tapOnRegister(true)),
                    const SizedBox(height: 20),
                    CustomButton(
                        title: 'Log in',
                        onPressed: () => locator<Routes>().tapOnLogin(true),
                        type: ButtonType.white),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
