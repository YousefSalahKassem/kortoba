import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:provider/provider.dart';

import '../../../components/button_app.dart';
import '../../../components/text_field_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';

class ForgotBody extends StatelessWidget {
  const ForgotBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Form(
        key: controller.forgotKey,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(reset, width: context.height30 * 12),
              Padding(
                padding: EdgeInsets.all(context.height15),
                child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(context.height10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(context.height15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: context.height10),
                          TextApp(text: email,style: TextStyle(color: labelsColor, fontSize: context.height20, fontWeight: FontWeight.w700),),
                          SizedBox(height: context.height10),
                          TextFieldApp(
                              valid: emailRequired,
                              controller: controller.emailController,
                              icon: Icons.email,
                              type: TextInputType.emailAddress),
                          SizedBox(height: context.height30),
                          ButtonApp(color: buttonColor, text: resetPassword, onPressed: (){
                            if (controller.forgotKey.currentState!.validate()) {
                                controller.forgotPassword(context);
                            }
                          }),
                          SizedBox(height: context.height10),
                        ],
                      ),
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}
