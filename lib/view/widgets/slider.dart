import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/view_models/slider_model.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatelessWidget {
  final CarouselController? controller;
  CustomSlider({this.controller});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SliderModel>();
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: 350.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (index, _) => model.changeIndexSlide(index)),
          items: model.sliderData.map(
            (el) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ImageTemplate(el.image),
                        SizedBox(height: 30),
                        Text(
                          el.title,
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        Text(
                          el.text,
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ).toList(),
        ),
        _Dots()
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: context.read<SliderModel>().sliderData.map(
        (el) {
          int index = context.watch<SliderModel>().sliderData.indexOf(el);
          return Container(
            width: context.read<SliderModel>().currentIndex == index
                ? 12.0
                : 6.0,
            height: context.read<SliderModel>().currentIndex == index
                ? 12.0
                : 6.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
                border: context.read<SliderModel>().currentIndex == index
                    ? Border.all(width: 3, color: accentColor)
                    : null,
                shape: BoxShape.circle,
                color: context.read<SliderModel>().currentIndex == index
                    ? Colors.white
                    : Color(0xFF9FA3A9)),
          );
        },
      ).toList(),
    );
  }
}
