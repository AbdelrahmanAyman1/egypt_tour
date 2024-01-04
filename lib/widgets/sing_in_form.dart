import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:egypt_tour/screens/forget_password.dart';
import 'package:egypt_tour/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../helper/show_dailog.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({super.key});

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  bool passwordVisible = true;
  IconData visibleIcon = Icons.visibility_off;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsetsDirectional.symmetric(
                  vertical: 10.h, horizontal: 10.w),
              alignment: Alignment.topLeft,
              child: Text(
                'Email',
                style: GoogleFonts.radioCanada(
                    fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            CustomTextField(
                errorMessage: 'Please Enter Your Email',
                controller: emailController,
                hint: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress),
            Container(
              margin: EdgeInsetsDirectional.symmetric(
                  vertical: 10.h, horizontal: 10.w),
              alignment: Alignment.topLeft,
              child: Text(
                'Password',
                style: GoogleFonts.radioCanada(
                    fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            CustomTextField(
                errorMessage: 'Please Enter Your Password ',
                controller: passwordController,
                hint: 'Enter Your Password',
                obscureText: passwordVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      visiblePassword();
                    },
                    icon: Icon(visibleIcon))),
            SizedBox(height: 5.h),
            Container(
              margin: EdgeInsetsDirectional.symmetric(
                  vertical: 5.h, horizontal: 10.w),
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text(
                  'Forget Password ?',
                  style: GoogleFonts.radioCanada(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: Colors.red),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              child: CustomButton(
                  text: 'Sign In',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      singIn();
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> singIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        awesomeDialog('error', 'No user found for that email.', context,
            DialogType.error);
        print('No user found for that email.');
      } else if (e.code.isNotEmpty) {
        awesomeDialog('error', 'Wrong password provided for that user.',
            context, DialogType.error);
        print('Wrong password provided for that user.');
      }
    }
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
