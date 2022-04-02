import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/models/slider_item_data.dart';
import 'package:flutter_tdt/core/view_models/slider_view.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CustomSlider extends StatelessWidget {
  final CarouselController? controller;
  const CustomSlider({this.controller});

  @override
  Widget build(BuildContext context) {
    final model = context.read<SliderView>();
    return Column(
      children: [
        CarouselSlider(
          carouselController: controller,
          options: CarouselOptions(
              height: 350.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              viewportFraction: 1,
              onPageChanged: (index, _) => model.changeIndexSlide(index)),
          items: model.sliderData.map(
            (el) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: _ItemSlider(el),
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

class _ItemSlider extends StatelessWidget {
  final SliderItemData item;
  const _ItemSlider(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageTemplate(item.image),
        const SizedBox(height: 30),
        Text(
          item.title,
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 20),
        Text(
          item.text,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.read<SliderView>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: provider.sliderData.map(
        (el) {
          int index = context.watch<SliderView>().sliderData.indexOf(el);
          return Container(
            width: provider.currentIndex == index ? 12.0 : 6.0,
            height: provider.currentIndex == index ? 12.0 : 6.0,
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
                border: provider.currentIndex == index
                    ? Border.all(width: 3, color: accentColor)
                    : null,
                shape: BoxShape.circle,
                color: provider.currentIndex == index
                    ? Colors.white
                    : const Color(0xFF9FA3A9)),
          );
        },
      ).toList(),
    );
  }
}
