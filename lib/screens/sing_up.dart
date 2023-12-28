import 'package:egypt_tour/widgets/custom_button.dart';
import 'package:egypt_tour/widgets/sing_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SingUp extends StatelessWidget {
  static String routeName = 'singUp';

  const SingUp({super.key});

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
              'Sing up',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
            Text(
              textAlign: TextAlign.center,
              'please sign in to continue',
              style:
                  GoogleFonts.radioCanada(fontSize: 15.sp, color: Colors.grey),
            ),
            const SingUpForm(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              child: const CustomButton(text: 'Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
