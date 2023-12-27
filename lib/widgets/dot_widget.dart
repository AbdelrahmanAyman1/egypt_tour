import 'package:flutter/material.dart';

import '../constant/constant.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            content.length,
            (index) => AnimatedContainer(
                margin: const EdgeInsetsDirectional.only(end: 2, bottom: 150),
                decoration: BoxDecoration(
                    color: currentIndex == index ? primaryColor : Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(50))),
                height: 10,
                width: currentIndex == index ? 50 : 20,
                duration: const Duration(milliseconds: 600))));
  }
}
