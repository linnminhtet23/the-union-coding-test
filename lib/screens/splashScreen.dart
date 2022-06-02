import 'dart:async';

import 'package:coding_test_project/constants/activeconstant.dart';
import 'package:coding_test_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => 
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(color: activeColors.primary),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      "assets/animations/lung.json",
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     CircularProgressIndicator(
                      color: activeColors.progressColor,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "The Union",
                      style: activeTextStyles.splashscreenHeader,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "CENTURY OF LEADERSHIP IN LUNG HEALTH",
                      style: activeTextStyles.splashscreenSubHeader,
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
