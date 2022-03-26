import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/models/models.dart';
import 'package:flutter_tdt/view/widgets/widgets.dart';

final List courses = mockData.map((e) => Course.fromJson(e)).toList();
class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: ListView.separated(
          clipBehavior: Clip.none,
          itemBuilder: (_, i) =>  CourseCard(courses[i]),
          separatorBuilder: (_, __) => const SizedBox(height: 15),
          itemCount: courses.length,
        ));
  }
}

List<Map> mockData = [
  {
    'title': 'Start Free Module',
    'descritrion':
        'In this course I\'ll show the step by step, day by day process to build better products, just as Google, Slack, KLM and manu other do.',
    'modules_qty': 1,
    'time': 20,
    'price': 0.0,
    'image':
        'https://prod-discovery.edx-cdn.org/media/course/image/0e575a39-da1e-4e33-bb3b-e96cc6ffc58e-8372a9a276c1.png',
  },
  {
    'title': 'Get Full Course',
    'descritrion':
        'In this course I\'ll show the step by step, day by day process to build better products, just as Google, Slack, KLM and manu other do.',
    'modules_qty': 4,
    'time': 120,
    'price': 20.0,
    'image':
        'https://s35691.pcdn.co/wp-content/uploads/2021/08/young-man-with-computer-fills-schedule-calendar-and-complete-business-vector-id1161496973.jpg',
  },
];
