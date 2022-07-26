import 'package:flutter/material.dart';

class TextButtonApp extends StatelessWidget {
  String text;
  TextStyle? style;
  TextAlign? textAlign;
  VoidCallback onPressed;
  TextButtonApp({Key? key,required this.text,this.style,this.textAlign,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(onPressed: onPressed, child: Text(text,style: style,textAlign: textAlign,));
  }
}
