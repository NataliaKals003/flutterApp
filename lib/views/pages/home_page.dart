import 'package:flutter/material.dart';
import 'package:flutterApp/data/constants.dart';
import 'package:flutterApp/views/pages/course_page.dart';
import 'package:flutterApp/widgets/container_widget.dart';
import 'package:flutterApp/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      KValue.basicLayout,
      KValue.cleanUi,
      KValue.fixBug,
      KValue.keyConcepts,
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Home', nextPage: CoursePage()),
            Column(
              children: List.generate(
                list.length,
                (index) => ContainerWidget(
                  title: list.elementAt(index),
                  description: 'This is the description for item ${index + 1}.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
