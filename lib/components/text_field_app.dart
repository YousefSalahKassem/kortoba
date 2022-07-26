import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';

import '../modules/auth_controller.dart';
import '../styles/colors.dart';

class TextFieldApp extends StatelessWidget {
  String valid;
  TextEditingController controller;
  IconData? icon;
  TextInputType type;
  bool isPassword;
  TextFieldApp({Key? key,required this.valid,required this.controller, this.icon,required this.type , this.isPassword=false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authController = Provider.of<AuthController>(context);

    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword?authController.isShowing?true:false:false,
          style: TextStyle(
              color: blackColor,
              fontWeight: FontWeight.normal,
              fontSize: context.height15),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return valid;
            }
            return null;
          },
          decoration: InputDecoration(
            suffixIcon: isPassword?IconButton(onPressed: (){
              authController.show();
            }, icon: Icon(icon,color: iconColor,size: context.height20*1.3,)):null,
            filled: true,
            fillColor: formFieldColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(context.height10),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: context.height15),
          ),
        )
      ],
    );
  }
}
