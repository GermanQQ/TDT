import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/models/models.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  const CourseCard(this.course);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 3,
      type: MaterialType.card,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Text(
                  course.title,
                  style: Theme.of(context).textTheme.headline2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                course.descritrion,
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              ImageTemplate(course.imageUrl, heigth: 140),
              const SizedBox(height: 20),
              _BottomTags(
                  qtyModules: course.qtyModules,
                  time: course.time,
                  price: course.price)
            ],
          )),
    );
  }
}

class _BottomTags extends StatelessWidget {
  final int qtyModules;
  final int time;
  final num price;
  const _BottomTags(
      {required this.qtyModules, required this.time, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            _Tag('$qtyModules Module'),
            const SizedBox(width: 10),
            const Icon(Icons.timer_sharp, color: accentColor, size: 22),
            const SizedBox(width: 4),
            Text('$time min', style: TDTTheme.smallBoltBlack),
          ],
        ),
        _PaymentTag(price: price)
      ],
    );
  }
}

class _PaymentTag extends StatelessWidget {
  final num price;
  const _PaymentTag({required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: price != 0 ? accentColor : greenColor,
      ),
      child: Text(price != 0 ? '$price\$' : 'Free',
          textAlign: TextAlign.center, style: TDTTheme.smallBoltWhite),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: accentColor,
      ),
      child: Text(text, style: TDTTheme.smallBoltWhite),
    );
  }
}
