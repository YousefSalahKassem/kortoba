import 'package:flutter/material.dart';
import 'package:kortoba/view/Home/screens/home_screen.dart';
import 'package:kortoba/view/Profile/screens/profile_screen.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          ProfileScreen()
        ]);
  }
}
