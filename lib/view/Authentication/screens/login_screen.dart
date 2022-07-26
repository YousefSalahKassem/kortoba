import 'package:flutter/material.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:kortoba/view/Authentication/widgets/build_app_bar.dart';
import 'package:kortoba/view/Authentication/widgets/build_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,login),
      resizeToAvoidBottomInset: false,
      body: const BuildBody(),
    );
  }
}
