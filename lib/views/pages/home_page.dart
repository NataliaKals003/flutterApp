import 'package:flutter/material.dart';
import 'package:hello_flutter/data/constants.dart';
import 'package:hello_flutter/widgets/container_widget.dart';
import 'package:hello_flutter/widgets/hero_widget.dart';

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
            HeroWidget(title: 'Home'),
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
