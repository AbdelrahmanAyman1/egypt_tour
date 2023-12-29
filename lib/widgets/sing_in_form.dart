import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'custom_text_feild.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '       Email',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold, fontSize: 16.sp),
            )),
        SizedBox(height: 10.h),
        const CustomTextField(
            hint: 'Enter Your Email', keyboardType: TextInputType.emailAddress),
        SizedBox(height: 20.h),
        Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              '       Password',
              style: GoogleFonts.radioCanada(
                  fontWeight: FontWeight.bold, fontSize: 16.sp),
            )),
        SizedBox(height: 10.h),
        CustomTextField(
            hint: 'Enter Your Password',
            obscureText: passwordVisible,
            suffixIcon: IconButton(
                onPressed: () {
                  visiblePassword();
                },
                icon: Icon(visibleIcon))),
      ],
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
