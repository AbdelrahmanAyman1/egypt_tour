import 'package:egypt_tour/constant/constant.dart';
import 'package:egypt_tour/widgets/custom_button.dart';
import 'package:egypt_tour/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static String routeName = 'forgetPasswordScreen';

  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/images/forget_password.gif',
              height: 300.h,
              width: double.infinity.w,
            ),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              'Forget your password?',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: primaryColor),
            ),
            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              'That\'s ok. it happens! Enter your email to reset password ',
              style: GoogleFonts.radioCanada(fontSize: 18.sp),
            ),
            SizedBox(height: 10.h),
            const CustomTextField(
                hint: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                errorMessage: 'please enter your email'),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 100.w),
              child: CustomButton(
                text: 'Reset Password',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
