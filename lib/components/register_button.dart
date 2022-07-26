import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';

class RegisterButton extends StatelessWidget {
  Color color;
  VoidCallback onPressed;
  String text;

  RegisterButton(
      {Key? key,
        required this.color,
        required this.text,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: context.screenWidth,
          height: context.height30*1.8,
          decoration: BoxDecoration(
            color: transparent,
            border: Border.all(color: color, width: context.height10/10),
            borderRadius: BorderRadius.circular(context.height10),
          ),
          child: Center(
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(person,color: color,width: context.height20,height: context.height15*1.2,),
              SizedBox(width: context.height10/2,),
              TextApp(text: text,style: TextStyle(
              fontWeight: FontWeight.w400,
              color: color,
              fontSize: context.height20,
            ),),
              ],
            ))
      ),
    );
  }
}