import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';

import '../../../styles/colors.dart';

AppBar buildAppBar(BuildContext context, String title) {
  return AppBar(
    title: Text(title, style: TextStyle(fontSize: context.height20, fontWeight: FontWeight.bold, color: Colors.white)),
    centerTitle: false,
    foregroundColor: Colors.white,
    bottom:  TabBar(
        isScrollable: false,
        indicatorColor: whiteColor,
        unselectedLabelColor: Colors.grey,
        labelColor: whiteColor,
        labelStyle: TextStyle(fontSize: context.height20, fontWeight: FontWeight.w600),
        tabs: const [
          Tab(
            text: mainScreen,
          ),
          Tab(
            text: profile,
          ),
        ]
    ),
  );
}
