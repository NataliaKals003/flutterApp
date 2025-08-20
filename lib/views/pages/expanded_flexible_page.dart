import 'package:flutter/material.dart';

class ExpandedFlexiblePage extends StatelessWidget {
  const ExpandedFlexiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded and Flexible Widgets')),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 200,
                  color: Colors.orange,
                  child: Center(child: Text('Expanded Widget')),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                  child: Center(child: Text('Expanded Widget')),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
