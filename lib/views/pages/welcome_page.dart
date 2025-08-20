import 'package:flutter/material.dart';
import 'package:flutterApp/views/pages/login_page.dart';
import 'package:flutterApp/views/pages/onboarding_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double widthSreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: FractionallySizedBox(
              widthFactor: widthSreen > 500 ? 0.5 : 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/lotties/welcome.json', height: 300),
                  FittedBox(
                    child: Text(
                      'Flutter',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 50,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FilledButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return OnboardingPage();
                          },
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text('Get Started'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage(title: 'Login');
                          },
                        ),
                      );
                    },
                    child: Text('Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
