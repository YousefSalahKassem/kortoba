import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';

AppBar buildAppBar (BuildContext context , String title) {
  return AppBar(
    title:  Text(title , style: TextStyle(fontWeight: FontWeight.bold,fontSize: context.height20),),
    foregroundColor: whiteColor,
  );
}