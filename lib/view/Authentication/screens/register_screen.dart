import 'package:flutter/material.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:kortoba/view/Authentication/widgets/build_app_bar.dart';
import '../widgets/register_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,register),
      body: const RegisterBody(),
    );
  }
}
