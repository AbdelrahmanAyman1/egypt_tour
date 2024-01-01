import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_button.dart';
import 'custom_text_feild.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
    );
  }
}
