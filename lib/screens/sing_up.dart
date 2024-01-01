import 'package:egypt_tour/screens/home.dart';
import 'package:egypt_tour/screens/sing_in.dart';
import 'package:egypt_tour/widgets/connected_with_row.dart';
import 'package:egypt_tour/widgets/sing_up_form.dart';
import 'package:egypt_tour/widgets/singin_and_singup_logo.dart';
import 'package:egypt_tour/widgets/title_and_desc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../widgets/have_acc_or_not.dart';

class SingUp extends StatelessWidget {
  static String routeName = 'singUp';

  const SingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(child: Logo()),
              const TitleAndDescription(
                  title: 'Sing up', desc: 'please sign up to continue'),
              SizedBox(height: 10.h),
              const SingUpForm(),
              const ConnectedWithRow(),
              SizedBox(height: 10.h),
              InkWell(
                  onTap: () {
                    signInWithGoogle(context);
                  },
                  child: Image.asset('assets/images/google_logo.png',
                      height: 24.h, width: 24.w)),
              SizedBox(height: 10.h),
              HaveAccountOrNot(
                questionText: 'Already  have an account ? ',
                goToPage: 'sign in',
                onTap: () {
                  Navigator.pushReplacementNamed(context, SingIn.routeName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }
}
