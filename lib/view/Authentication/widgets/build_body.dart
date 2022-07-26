import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/components/button_app.dart';
import 'package:kortoba/components/register_button.dart';
import 'package:kortoba/components/text_button.dart';
import 'package:kortoba/components/text_field_app.dart';
import 'package:kortoba/components/waiting.dart';
import 'package:kortoba/service/global/authentication_service.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Authentication/screens/forgot_screen.dart';
import 'package:kortoba/view/Authentication/screens/register_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../components/text_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';
import '../../../styles/strings.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    var authService = Provider.of<FirebaseAuthenticationService>(context);
    return authService.isLoading
        ? const Center(
            child: Waiting(text: waiting),
          )
        : Form(
            key: controller.loginKey,
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
                    valid: emailRequired,
                    controller: controller.emailController,
                    isPassword: false,
                    type: TextInputType.emailAddress,
                    icon: Icons.abc,
                  ),
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
                      valid: passwordRequired,
                      controller: controller.passwordController,
                      icon: Icons.remove_red_eye,
                      isPassword: true,
                      type: TextInputType.visiblePassword),
                ),
                SizedBox(
                  height: context.height10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.height15),
                    child: TextButtonApp(
                        onPressed: () {
                          AppRoute.push(const ForgotScreen());
                        },
                        text: forgotPassword,
                        style: TextStyle(
                            fontSize: context.height15 * 1.3,
                            color: secondaryColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(
                  height: context.height30 * 1.5,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.height15),
                    child: ButtonApp(
                        color: buttonColor,
                        text: login,
                        onPressed: () {
                          if (controller.loginKey.currentState!.validate()) {
                            controller.loginUser(context);
                          }
                        })),
                SizedBox(
                  height: context.height20,
                ),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.height20),
                      child: TextApp(
                          text: or,
                          style: TextStyle(
                              fontSize: context.height20,
                              color: labelsColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(
                  height: context.height30 * 1.5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextApp(
                      text: dontHaveAccount,
                      style: TextStyle(
                          fontSize: context.height15 * 1.3,
                          color: labelsColor,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  height: context.height30,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.height15),
                    child: RegisterButton(
                        color: buttonColor,
                        text: registerButton,
                        onPressed: () {
                          AppRoute.push(const RegisterScreen());
                        })),
              ],
            ));
  }
}
