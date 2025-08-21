//This page is used for the login functionality of the app.
//It contains text fields for email and password input, and a button to submit the login request

import 'package:flutter/material.dart';
import 'package:flutterApp/views/widget_tree.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController(text: '123');
  TextEditingController controllerPassword = TextEditingController(text: '123');
  String conformedEmail = '123';
  String conformedPassword = '123';

  @override
  void dispose() {
    //Don't need the login anymore
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return FractionallySizedBox(
                  widthFactor: constraints.maxWidth > 500 ? 0.5 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lotties/home.json', height: 300),
                      TextField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onEditingComplete: () => setState(() {}),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: controllerPassword,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onEditingComplete: () => setState(() {}),
                      ),
                      SizedBox(height: 20),
                      FilledButton(
                        onPressed: () {
                          onLoginButtonPressed();
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text(widget.title),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onLoginButtonPressed() {
    if (conformedEmail == controllerEmail.text &&
        conformedPassword == controllerEmail.text) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
    }
  }
}
