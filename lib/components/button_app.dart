import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';

class ButtonApp extends StatelessWidget {
  Color color;
  VoidCallback onPressed;
  String text;
  double? width;
  ButtonApp(
      {Key? key,
        required this.color,
        required this.text,
        this.width,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width??context.screenWidth,
          height: context.height30*1.8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(context.height10),
          ),
          child: Center(
            child:  TextApp(text: text,style: TextStyle(
              fontWeight: FontWeight.bold,
              color: whiteText,
              fontSize: context.height20,
            ),),
          )
      ),
    );
  }
}