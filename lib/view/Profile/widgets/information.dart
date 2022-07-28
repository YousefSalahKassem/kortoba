import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/modules/auth_controller.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:provider/provider.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = Provider.of<AuthController>(context);
    return FutureBuilder(
        future: controller.getCurrentUser(),
        builder: (context,snapshot){
          return Column(
            children: [
              TextApp(text: controller.user.name!, style: TextStyle( color: secondaryColor, fontSize: context.height20*1.1, fontWeight: FontWeight.bold),),
              SizedBox(height: context.height10/2),
              TextApp(text: controller.user.email!, style: TextStyle( color: commentLabel, fontSize: context.height15*.9, fontWeight: FontWeight.bold),),
            ],
          );
        });
  }
}
