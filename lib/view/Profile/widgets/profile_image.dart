import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';

import '../../../styles/colors.dart';
import '../../../styles/images.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.splashImage*2,
      color: transparent,
      child: Center(
        child: Container(
          height: context.height30*5,
          width: context.height30*5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(context.height30*5),
              image: const DecorationImage(
                image: AssetImage(background),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  spreadRadius: context.height10,
                  blurRadius: context.height30*.8,
                  offset: Offset(0, context.height10/8),
                )
              ]
          ),
        ),
      ),
    );
  }
}
