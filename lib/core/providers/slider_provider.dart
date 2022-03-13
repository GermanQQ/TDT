import 'package:flutter_tdt/core/models/models.dart';
import 'package:flutter_tdt/core/providers/base_provider.dart';

class SliderProvider extends BaseProvider {
  int currentIndex = 0;
  final sliderData = [
    SliderItemData(
      title: 'Start Your Truck Dispatcher Career',
      text:
          'Impeet viverra vivamus porttior ules ac vulte lectus velit sen lectus ue',
      image:
          'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg',
    ),
    SliderItemData(
      title: 'Free Module to Start',
      text:
          'Impeet viverra vivamus porttior ules ac vulte lectus velit sen lectus ue ',
      image:
          'https://static.independent.co.uk/2021/12/07/10/PRI213893584.jpg?quality=75&width=982&height=726&auto=webp',
    ),
    SliderItemData(
      title: 'Get Digital Certificate',
      text:
          'Impeet viverra vivamus porttior ules ac vulte lectus velit sen lectus ue',
      image:
          'https://ichef.bbci.co.uk/news/999/cpsprodpb/15951/production/_117310488_16.jpg',
    )
  ];

  changeIndexSlide(int index) {
    currentIndex = index;
    refresh();
  }
}
