import 'package:flutter/material.dart';
import 'package:kortoba/components/waiting.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import 'package:kortoba/view/Authentication/widgets/fill_confirm_password.dart';
import 'package:kortoba/view/Authentication/widgets/fill_first_name.dart';
import 'package:kortoba/view/Authentication/widgets/fill_last_name.dart';
import 'package:provider/provider.dart';
import '../../../components/button_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../service/global/authentication_service.dart';
import '../../../styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'fill_email.dart';
import 'fill_password.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    var authService = Provider.of<FirebaseAuthenticationService>(context);

    return authService.isLoading
        ? const Center(
            child: Waiting(text: loading),
          )
        : Form(
            key: controller.registerKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: context.height30,
                  ),
                  const FillEmail(),
                  const FillPassword(),
                  const FillConfirmPassword(),
                  const FillFirstName(),
                  const FillLastName(),
                  SizedBox(
                    height: context.height20,
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.height15),
                      child: ButtonApp(
                          color: buttonColor,
                          text: AppLocalizations.of(context)!.register,
                          onPressed: () {
                            if (controller.registerKey.currentState!
                                    .validate() &&
                                controller.passwordController.text.trim() ==
                                    controller.confirmPasswordController.text
                                        .trim()) {
                              controller.registerUser(context);
                            } else {
                              print("error");
                            }
                          })),
                  SizedBox(
                    height: context.height20,
                  ),
                ],
              ),
            ));
  }
}
