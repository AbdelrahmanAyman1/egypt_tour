import 'package:egypt_tour/constant/constant.dart';
import 'package:egypt_tour/screens/sing_in.dart';
import 'package:egypt_tour/screens/tabs/home_tab.dart';
import 'package:egypt_tour/screens/tabs/location_tab.dart';
import 'package:egypt_tour/screens/tabs/profile_tab.dart';
import 'package:egypt_tour/screens/tabs/search_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../widgets/custom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Widget> tabs = const [
    HomeTab(),
    SearchTab(),
    LocationTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(
        index: index,
        onTabChange: (value) {
          setState(() {
            index = value;
          });
        },
      ),
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
        title: Text(index == 0
            ? 'Home'
            : index == 1
                ? 'Search'
                : index == 2
                    ? 'Location'
                    : 'Profile'),
        backgroundColor: primaryColor,
      ),
      body: tabs[index],
    );
  }
}
