import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';


class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextApp(text: FirebaseAuth.instance.currentUser!.displayName!, style: TextStyle( color: secondaryColor, fontSize: context.height20*1.1, fontWeight: FontWeight.bold),),
        SizedBox(height: context.height10/2),
        TextApp(text: FirebaseAuth.instance.currentUser!.email!, style: TextStyle( color: commentLabel, fontSize: context.height15*.9, fontWeight: FontWeight.bold),),
      ],
    );
  }
}
