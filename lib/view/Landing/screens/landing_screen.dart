import 'package:flutter/material.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:kortoba/view/Landing/widgets/build_app_Bar.dart';
import 'package:kortoba/view/Landing/widgets/build_body.dart';
import '../widgets/build_drawer.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: buildAppBar(context, mainScreen),
          body: const BuildBody(),
          drawer: buildDrawer(context),
        )
    );
  }
}
