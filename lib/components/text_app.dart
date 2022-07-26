import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  String text;
  TextStyle? style;
  TextAlign? textAlign;
  TextApp({Key? key,required this.text,this.style,this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Text(text,style: style,textAlign: textAlign,));
  }
}
