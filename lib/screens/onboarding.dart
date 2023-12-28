import 'package:egypt_tour/constant/constant.dart';
import 'package:egypt_tour/model/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/dot_widget.dart';

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              itemCount: content.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(content[currentIndex].image),
                    Text(
                      content[currentIndex].title,
                      style: GoogleFonts.radioCanada(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff89C9FF)),
                    ),
                    Center(
                      child: Text(
                          textAlign: TextAlign.center,
                          content[currentIndex].desc,
                          style: GoogleFonts.radioCanada(
                            fontSize: 18,
                            color: Colors.black,
                          )),
                    ),
                  ],
                );
              },
            ),
          ),
          DotsWidget(currentIndex: currentIndex)
        ],
      ),
    );
  }
}
