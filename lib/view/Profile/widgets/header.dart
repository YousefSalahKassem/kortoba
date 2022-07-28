import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import 'package:kortoba/view/Profile/widgets/information.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          background,
          fit: BoxFit.cover,
          height: context.splashImage,
          width: context.screenWidth,
        ),
        SizedBox(
          height: context.height30*4,
        ),
        const Information(),
      ],
    );
  }
}
