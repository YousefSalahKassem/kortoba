import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/dimensions.dart';

import '../../../styles/colors.dart';

class SettingsItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;
  const SettingsItem({Key? key, required this.text, required this.icon,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: buttonColor,
          radius: context.height30,
          child: IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            onPressed: onPressed,
          ),
        ),
        SizedBox(
          height: context.height10,
        ),
        TextApp(text: text, style: TextStyle(fontWeight: FontWeight.normal, fontSize:context.height15,color: secondaryColor),)
      ],
    );
  }
}
