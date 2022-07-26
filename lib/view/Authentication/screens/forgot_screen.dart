import 'package:flutter/material.dart';
import 'package:kortoba/view/Authentication/widgets/forgot_body.dart';

import '../../../styles/strings.dart';
import '../widgets/build_app_bar.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, resetPassword),
      body: const ForgotBody(),
      resizeToAvoidBottomInset: false,
    );
  }
}
