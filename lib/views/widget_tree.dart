import 'package:flutter/material.dart';
import 'package:hello_flutter/data/constants.dart';
import 'package:hello_flutter/data/notifiers.dart';
import 'package:hello_flutter/views/pages/home_page.dart';
import 'package:hello_flutter/views/pages/profile_page.dart';
import 'package:hello_flutter/views/pages/settings_page.dart';
import 'package:hello_flutter/widgets/navbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: 'Settings');
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 117, 196, 188),
        onPressed: () async {
          isDarkModeNotifier.value = !isDarkModeNotifier.value;
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool(
            KConstants.themeModeKey,
            isDarkModeNotifier.value,
          );
        },
        child: ValueListenableBuilder(
          valueListenable: isDarkModeNotifier,
          builder: (context, isDark, child) {
            return Icon(
              isDark ? Icons.dark_mode : Icons.light_mode,
              color: Colors.white,
            );
          },
        ),
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
