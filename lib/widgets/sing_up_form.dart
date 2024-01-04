import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/show_dailog.dart';
import '../screens/home.dart';
import 'custom_button.dart';
import 'custom_text_feild.dart';

class SingUpForm extends StatefulWidget {
  const SingUpForm({super.key});

  @override
  State<SingUpForm> createState() => _SingUpFormState();
}

class _SingUpFormState extends State<SingUpForm> {
  bool passwordVisible = true;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  IconData visibleIcon = Icons.visibility_off;

  TextEditingController userNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              errorMessage: 'please enter your user name',
              hint: 'Enter Your Username',
              controller: userNameController,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              errorMessage: 'please enter your email',
              hint: 'Enter Your Email',
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
              errorMessage: 'please enter your phone',
              hint: 'Enter Your Phone Number',
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),
            SizedBox(height: 10.h),
            CustomTextField(
                errorMessage: 'please enter your password',
                controller: passwordController,
                hint: 'Enter Your Password',
                obscureText: passwordVisible,
                suffixIcon: IconButton(
                    onPressed: () {
                      visiblePassword();
                    },
                    icon: Icon(visibleIcon))),
            SizedBox(height: 10.h),
            CustomTextField(
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Conform password is required please enter';
                } else if (value != passwordController.text) {
                  return 'Confirm password not matching';
                }

                return null;
              },
              //errorMessage: 'please enter your password',
              controller: confirmPasswordController,
              hint: 'confirm password',
              obscureText: passwordVisible,
              suffixIcon: IconButton(
                onPressed: () {
                  visiblePassword();
                },
                icon: Icon(
                  visibleIcon,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
              child: CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    singUp();
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void singUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      addUser();
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } on FirebaseAuthException catch (e) {
      if (e.code.isNotEmpty) {
        awesomeDialog('error', e.message.toString(), context, DialogType.error);
      } else if (e.code.isNotEmpty) {
        awesomeDialog('error', e.message.toString(), context, DialogType.error);
      }
    } catch (e) {
      debugPrint(e as String?);
    }
  }

  Future<void> addUser() {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.add({
      'user_name': userNameController.text, // John Doe
      'email': emailController.text, // Stokes and Sons
      'phone': phoneController.text // 42
    });
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
