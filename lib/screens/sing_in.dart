import 'package:egypt_tour/screens/sing_up.dart';
import 'package:egypt_tour/widgets/sing_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/constant.dart';
import '../widgets/custom_button.dart';

class SingIn extends StatelessWidget {
  static String routeName = 'singIn';

  const SingIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 154.h,
              width: 153.w,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            textAlign: TextAlign.center,
            'Sing in',
            style: GoogleFonts.radioCanada(
                fontWeight: FontWeight.bold, fontSize: 25.sp),
          ),
          Text(
            textAlign: TextAlign.center,
            'please sign in to continue',
            style: GoogleFonts.radioCanada(fontSize: 15.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          const SingInForm(),
          SizedBox(height: 5.h),
          Text(
            '        Forget password ?',
            style: GoogleFonts.radioCanada(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.red),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
            child: const CustomButton(text: 'Sign In'),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                  child: Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 2.w,
                indent: 20.w,
              )),
              Text(
                'Or connected With',
                style: GoogleFonts.radioCanada(
                    fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              Expanded(
                  child: Divider(
                thickness: 2,
                color: Colors.black,
                endIndent: 20.w,
                indent: 2.w,
              )),
            ],
          ),
          SizedBox(height: 10.h),
          InkWell(
              child: Image.asset('assets/images/google_logo.png',
                  height: 24.h, width: 24.w)),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don’t have an account ? ',
                style: GoogleFonts.radioCanada(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, SingUp.routeName);
                },
                child: Text(
                  'Sing up',
                  style: GoogleFonts.radioCanada(
                      color: primaryColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
