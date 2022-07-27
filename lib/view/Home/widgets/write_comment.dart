import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';

import '../../../styles/colors.dart';
import '../../../util/max_line_formatter.dart';

class WriteComment extends StatelessWidget {
  final TextEditingController controller;
  const WriteComment({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int maxLength = 120;
    const int maxLines = 2;
    const  int maxLinesForced = 2;
    return TextField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: TextInputAction.done,
      style: TextStyle(color: secondaryColor, fontSize: context.height20),
      inputFormatters: [
        MaxLinesTextInputFormatter(maxLinesForced, () {
        }),
      ],
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: buttonColor,width: context.height10/5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: buttonColor,width: context.height10/5),
        ),
        counterStyle: TextStyle(color: commentLabel, fontSize: context.height20/1.2),
      ),
    );
  }
}
