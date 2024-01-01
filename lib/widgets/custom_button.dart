import 'package:egypt_tour/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            padding: EdgeInsetsDirectional.symmetric(vertical: 10.h)),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.radioCanada(color: Colors.white, fontSize: 16.sp),
        ));
  }
}
