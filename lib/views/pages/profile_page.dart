//This page displays the user's profile and allows them to log out.
//When the user logs out, they are redirected to the WelcomePage.

import 'package:flutter/material.dart';
import 'package:flutterApp/data/notifiers.dart';
import 'package:flutterApp/views/pages/welcome_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/background.jpg'),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              selectedPageNotifier.value = 0; // Reset to the first page
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return WelcomePage();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
