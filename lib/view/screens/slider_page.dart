import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/view/view_models/slider_view.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  static MaterialPage page() {
    return MaterialPage(
      name: Routes.sliderPage,
      key: ValueKey(Routes.sliderPage),
      child: ChangeNotifierProvider<SliderView>(
        create: (_) => SliderView()..loadData(),
        child: const SliderPage(),
      ),
    );
  }

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final CarouselController _buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<SliderView>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            visible: provider.sliderData.isNotEmpty,
            child: SkipButton(
              onPressed: () => _buttonCarouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: context
                  .select(((SliderView value) => value.state == ViewState.Busy))
              ? const SplashWidget()
              : DefaultWrapper(
                  child: Column(
                    children: [
                      CustomSlider(controller: _buttonCarouselController),
                      const SizedBox(height: 20),
                      BaseButton(ButtonType.blue).create(title: 'Register', onTap: ()=> provider.onPressRegister()),
                      CustomButton(
                        title: 'Register',
                        onPressed: () => provider.onPressRegister(),
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                          title: 'Log in',
                          onPressed: () => provider.onPressLogin(),
                          type: ButtonType.white),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
