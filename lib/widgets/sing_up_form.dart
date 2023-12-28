import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'custom_text_feild.dart';

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        const CustomTextField(hint: 'Enter Your Username'),
        SizedBox(height: 10.h),
        const CustomTextField(
            hint: 'Enter Your Email', keyboardType: TextInputType.emailAddress),
        SizedBox(height: 10.h),
        const CustomTextField(
            hint: 'Enter Your Phone Number', keyboardType: TextInputType.phone),
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
