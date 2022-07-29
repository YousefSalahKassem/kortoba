import 'package:flutter/material.dart';
import 'package:kortoba/components/button_app.dart';
import 'package:kortoba/components/register_button.dart';
import 'package:kortoba/components/text_button.dart';
import 'package:kortoba/components/waiting.dart';
import 'package:kortoba/service/global/authentication_service.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Authentication/screens/forgot_screen.dart';
import 'package:kortoba/view/Authentication/screens/register_screen.dart';
import 'package:kortoba/view/Authentication/widgets/fill_email.dart';
import 'package:kortoba/view/Authentication/widgets/fill_password.dart';
import 'package:provider/provider.dart';
import '../../../components/text_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    var authService = Provider.of<FirebaseAuthenticationService>(context);
    return authService.isLoading
        ?  Center(
            child: Waiting(text: AppLocalizations.of(context)!.waiting),
          )
        : Form(
            key: controller.loginKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: context.height30,
                ),
                const FillEmail(),
                const FillPassword(),
                Row(
                  children: [
                    Expanded(child: Container()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: context.height15),
                      child: TextButtonApp(
                          onPressed: () {
                            AppRoute.push(const ForgotScreen());
                          },
                          text: AppLocalizations.of(context)!.forgot_password,
                          style: TextStyle(
                              fontSize: context.height15 * 1.3,
                              color: secondaryColor,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
                SizedBox(
                  height: context.height30 * 1.5,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.height15),
                    child: ButtonApp(
                        color: buttonColor,
                        text: AppLocalizations.of(context)!.login,
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
                          text: AppLocalizations.of(context)!.or,
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
                      text: AppLocalizations.of(context)!.dontHaveAccount,
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
                        text: AppLocalizations.of(context)!.registerButton,
                        onPressed: () {
                          AppRoute.push(const RegisterScreen());
                        })),
              ],
            ));
  }
}
