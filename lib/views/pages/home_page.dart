import 'package:flutter/material.dart';
import 'package:hello_flutter/data/constants.dart';
import 'package:hello_flutter/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'Home'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to the Home Page!',
                        style: KTextStyles.titleTealText,
                      ),
                      Text(
                        'This is a simple example of using a Hero widget in Flutter.',
                        style: KTextStyles.descriptionText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
