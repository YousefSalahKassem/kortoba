import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/view/Favourite/widgets/build_app_bar.dart';
import 'package:kortoba/view/Favourite/widgets/build_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const BuildBody(),
    );
  }
}
