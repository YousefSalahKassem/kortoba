import 'package:flutter/material.dart';
import 'package:kortoba/modules/boarding_controller.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../styles/colors.dart';

AppBar buildAppBar(BuildContext context) {

  List<String> boardingTitles = [
    AppLocalizations.of(context)!.mainScreen,
    AppLocalizations.of(context)!.profile,
  ];

  BoardingController boardingController = Provider.of<BoardingController>(context);

  return AppBar(
    title: Text(boardingTitles[boardingController.tapIndex], style: TextStyle(fontSize: context.height20, fontWeight: FontWeight.bold, color: Colors.white)),
    centerTitle: false,
    foregroundColor: Colors.white,
    bottom: TabBar(
        isScrollable: false,
        indicatorColor: whiteColor,
        unselectedLabelColor: Colors.grey,
        labelColor: whiteColor,
        onTap: (index) {
          boardingController.setTapIndex(index);
        },
        labelStyle: TextStyle(fontSize: context.height20, fontWeight: FontWeight.w600),
        tabs: [
          Tab(
            text: AppLocalizations.of(context)!.mainScreen,
          ),
          Tab(
            text: AppLocalizations.of(context)!.profile,
          ),
        ]
    ),
  );
}
