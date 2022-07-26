import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/styles/images.dart';
import 'package:lottie/lottie.dart';

import '../../../util/functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  Future<String> updateSplash() async {
    await Future.delayed(const Duration(seconds: 4));
    return "-1";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
        child: LottieBuilder.asset(splash,
            repeat: false,

      ))
    );
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await updateSplash();
    await checkFirstSeen();
  }
}
