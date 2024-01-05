import 'package:egypt_tour/screens/forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/home.dart';
import '../screens/onboarding_screen.dart';
import '../screens/sing_in.dart';
import '../screens/sing_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? OnBoarding.routeName
              : HomeScreen.routeName,
          routes: {
            OnBoarding.routeName: (context) => const OnBoarding(),
            SingUp.routeName: (context) => const SingUp(),
            SingIn.routeName: (context) => const SingIn(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen()
          },
        );
      },
    );
  }
}
