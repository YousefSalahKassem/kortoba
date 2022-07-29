import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import '../../../components/text_app.dart';
import '../../../styles/colors.dart';

AppBar buildAppBar(BuildContext context,String title) {
  return AppBar(
    title: TextApp(text: title,style: TextStyle(color: secondaryColor,fontSize: context.height20*1.2, fontWeight: FontWeight.bold),),
    centerTitle: true,
    backgroundColor: transparent,
    elevation: 0,
  );
}