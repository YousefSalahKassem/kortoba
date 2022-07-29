import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kortoba/view/Authentication/widgets/fill_email.dart';
import 'package:provider/provider.dart';
import '../../../components/button_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';

class ForgotBody extends StatelessWidget {
  const ForgotBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    final GlobalKey<FormState> forgotKey = GlobalKey<FormState>();

    return Form(
        key:forgotKey,
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
                          const FillEmail(),
                          SizedBox(height: context.height30),
                          ButtonApp(color: buttonColor, text: AppLocalizations.of(context)!.reset_password, onPressed: (){
                            if (forgotKey.currentState!.validate()) {
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
