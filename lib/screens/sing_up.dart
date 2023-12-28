import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_text_feild.dart';

class SingUp extends StatefulWidget {
  static String routeName = 'singUp';

  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              'Sing up',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold, fontSize: 25.sp),
            ),
            Text(
              'please sign in to continue',
              style:
                  GoogleFonts.radioCanada(fontSize: 15.sp, color: Colors.grey),
            ),
            SizedBox(height: 10.h),
            const CustomTextField(hint: 'Enter Your Username'),
            SizedBox(height: 10.h),
            const CustomTextField(
                hint: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 10.h),
            const CustomTextField(
                hint: 'Enter Your Phone Number',
                keyboardType: TextInputType.phone),
            SizedBox(height: 10.h),
            CustomTextField(
                hint: 'Enter Your Password',
                obscureText: passwordVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      visiblePassword();
                    },
                    icon: Icon(visibleIcon))),
            SizedBox(height: 10.h),
            CustomTextField(
                hint: 'confirm password',
                obscureText: passwordVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      visiblePassword();
                    },
                    icon: Icon(visibleIcon))),
          ],
        ),
      ),
    );
  }

  void visiblePassword() {
    setState(() {
      if (passwordVisible == true) {
        passwordVisible = false;
        visibleIcon = Icons.visibility;
      } else if (passwordVisible == false) {
        passwordVisible = true;
        visibleIcon = Icons.visibility_off;
      }
    });
  }
}
