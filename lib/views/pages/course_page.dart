//Page using API to fetch random activities
// This page uses the Bored API to fetch random activities and display them.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterApp/data/classes/activity_class.dart';
import 'package:http/http.dart' as http;

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Future<Activity>? _futureActivity;
  bool isFirst = true;

  Future<Activity> fetchActivity() async {
    final response = await http.get(
      Uri.parse("https://bored-api.appbrewery.com/random"),
    );

    if (response.statusCode == 200) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }

  @override
  void initState() {
    super.initState();
    _futureActivity = fetchActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bored API Activity"),
        actions: [
          IconButton(
            icon: const Icon(Icons.switch_access_shortcut),
            onPressed: () {
              setState(() {
                isFirst = !isFirst;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder<Activity>(
          future: _futureActivity,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              final activity = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedCrossFade(
                      firstChild: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            activity.activity,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text("Type: ${activity.type}"),
                          Text("Participants: ${activity.participants}"),
                          Text("Duration: ${activity.duration}"),
                          Text("Kid Friendly: ${activity.kidFriendly}"),
                          Text("Price: ${activity.price}"),
                          Text("Availability: ${activity.availability}"),
                          Text("Accessibility: ${activity.accessibility}"),
                          const SizedBox(height: 10),
                          if (activity.link.isNotEmpty)
                            TextButton(
                              onPressed: () {
                                // Can use url_launcher package for external links
                              },
                              child: Text(activity.link),
                            ),
                        ],
                      ),
                      secondChild: Center(
                        child: Image.asset('assets/images/background.jpg'),
                      ),
                      crossFadeState: isFirst
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(seconds: 1),
                    ),
                  ),
                ),
              );
            } else {
              return const Text("No activity found");
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _futureActivity = fetchActivity();
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
