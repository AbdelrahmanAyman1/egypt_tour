import 'package:egypt_tour/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = 'forgetPasswordScreen';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/forget_password.gif',
            height: 300.h,
            width: double.infinity.w,
          ),
          SizedBox(height: 10.h),
          Text(
            'Forget your password?',
            style: GoogleFonts.radioCanada(
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
                color: primaryColor),
          )
        ],
      ),
    );
  }
}
