import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kortoba/view/Authentication/widgets/build_app_bar.dart';
import 'package:kortoba/view/Authentication/widgets/build_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,AppLocalizations.of(context)!.login),
      resizeToAvoidBottomInset: false,
      body: const BuildBody(),
    );
  }
}
