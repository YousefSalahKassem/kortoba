import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../components/button_app.dart';
import '../../../components/text_app.dart';
import '../../../components/text_field_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';
import '../../../styles/strings.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);

    return Form(
        key: controller.registerKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: context.height30,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextApp(
                    text: email,
                    style: TextStyle(
                        fontSize: context.height20,
                        color: labelsColor,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: context.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextFieldApp(
                    valid: "برجاء ادخال البريد الالكترونى",
                    controller: controller.emailController,
                    icon: Icons.email,
                    type: TextInputType.emailAddress),
              ),
              SizedBox(
                height: context.height20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextApp(
                    text: password,
                    style: TextStyle(
                        fontSize: context.height20,
                        color: labelsColor,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: context.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextFieldApp(
                    valid: "برجاء ادخال البريد الالكترونى",
                    controller: controller.passwordController,
                    icon: Icons.remove_red_eye,
                    isPassword: true,
                    type: TextInputType.visiblePassword),
              ),
              SizedBox(
                height: context.height20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextApp(
                    text: confirmPassword,
                    style: TextStyle(
                        fontSize: context.height20,
                        color: labelsColor,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: context.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextFieldApp(
                    valid: "برجاء ادخال البريد الالكترونى",
                    controller: controller.confirmPasswordController,
                    icon: Icons.remove_red_eye,
                    isPassword: true,
                    type: TextInputType.visiblePassword),
              ),
              SizedBox(
                height: context.height20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextApp(
                    text: firstName,
                    style: TextStyle(
                        fontSize: context.height20,
                        color: labelsColor,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: context.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextFieldApp(
                    valid: "برجاء ادخال البريد الالكترونى",
                    controller: controller.firstNameController,
                    icon: Icons.remove_red_eye,
                    isPassword: false,
                    type: TextInputType.name),
              ),
              SizedBox(
                height: context.height20,
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextApp(
                    text: lastName,
                    style: TextStyle(
                        fontSize: context.height20,
                        color: labelsColor,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: context.height10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.height15),
                child: TextFieldApp(
                    valid: "برجاء ادخال البريد الالكترونى",
                    controller: controller.lastNameController,
                    icon: Icons.remove_red_eye,
                    isPassword: false,
                    type: TextInputType.text),
              ),
              SizedBox(
                height: context.height20,
              ),

              SizedBox(
                height: context.height20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.height15),
                  child:
                  ButtonApp(color: buttonColor, text: register, onPressed: () {
                    if (controller.registerKey.currentState!.validate() && controller.passwordController.text.trim() == controller.confirmPasswordController.text.trim()) {
                        controller.registerUser(context);
                    }
                    else{
                      print("error");
                    }
                  })),

              SizedBox(
                height: context.height20,
              ),
            ],
          ),
        )
    );
  }
}
