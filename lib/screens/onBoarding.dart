import 'package:egypt_tour/model/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  static String routeName = 'onBoarding';

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'assets/images/img.png',
        ),
      ),
    );
  }
}
