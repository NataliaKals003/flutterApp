import 'package:flutter/material.dart';
import 'package:hello_flutter/data/notifiers.dart';
import 'package:hello_flutter/views/pages/home_page.dart';
import 'package:hello_flutter/views/pages/profile_page.dart';
import 'package:hello_flutter/views/pages/settings_page.dart';
import 'package:hello_flutter/widgets/navbar_widget.dart';

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
        onPressed: () {
          isDarkModeNotifier.value = !isDarkModeNotifier.value;
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
