import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../components/text_app.dart';
import '../../../components/text_field_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';

class FillEmail extends StatelessWidget {

  const FillEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.height15),
          child: TextApp(
              text: AppLocalizations.of(context)!.email,
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
            valid: AppLocalizations.of(context)!.emailRequired,
            controller: controller.emailController,
            isPassword: false,
            type: TextInputType.emailAddress,
            icon: Icons.abc,
          ),
        ),
        SizedBox(
          height: context.height20,
        ),
      ],
    );
  }
}
