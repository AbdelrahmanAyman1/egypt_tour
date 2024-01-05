import 'package:egypt_tour/constant/constant.dart';
import 'package:egypt_tour/screens/sing_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.w),
                bottomLeft: Radius.circular(30.w))),
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, SingIn.routeName);
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
        title: const Text('home'),
        backgroundColor: primaryColor,
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return GNav(
        tabMargin:
            EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 10.h),
        rippleColor: Colors.white,
        // tab button ripple color when pressed
        hoverColor: Colors.white,
        // tab button hover color

        tabBorderRadius: 15,
        curve: Curves.linear,
        // tab animation curves
        gap: 8,
        // the tab button gap between icon and text
        color: Colors.black,
        // unselected icon color
        activeColor: Colors.white,
        // selected icon and text color
        iconSize: 24,
        // tab button icon size
        tabBackgroundColor: primaryColor,
        // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
        // navigation bar padding
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search,
            text: 'Search',
          ),
          GButton(
            icon: Icons.directions_car_rounded,
            text: 'Location',
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          )
        ]);
  }
}
