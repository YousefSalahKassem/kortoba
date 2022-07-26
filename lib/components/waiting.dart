import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:lottie/lottie.dart';
import '../styles/colors.dart';
import '../styles/images.dart';

class Waiting extends StatelessWidget {
  final String text;
  const Waiting({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextApp(text: waiting,style: TextStyle(color: secondaryColor, fontWeight: FontWeight.w700, fontSize: context.height20),),
        LottieBuilder.asset(loading,width: context.height30*5,),
      ],
    );
  }
}
