import 'package:egypt_tour/screens/onboarding_screen.dart';
import 'package:egypt_tour/screens/sing_in.dart';
import 'package:egypt_tour/screens/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: OnBoarding.routeName,
          routes: {
            OnBoarding.routeName: (context) => const OnBoarding(),
            SingUp.routeName: (context) => const SingUp(),
            SingIn.routeName: (context) => const SingIn(),
          },
        );
      },
    );
  }
}
