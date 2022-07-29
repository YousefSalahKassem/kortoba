import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';
import '../../../components/text_app.dart';
import '../../../components/text_field_app.dart';
import '../../../modules/auth_controller.dart';
import '../../../styles/colors.dart';

class FillLastName extends StatelessWidget {
  const FillLastName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AuthController>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.height15),
          child: TextApp(
              text: AppLocalizations.of(context)!.lastName,
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
              valid: AppLocalizations.of(context)!.lastNameRequired,
              controller: controller.lastNameController,
              icon: Icons.remove_red_eye,
              isPassword: false,
              type: TextInputType.text),
        ),
        SizedBox(
          height: context.height20,
        ),
      ],
    );
  }
}
