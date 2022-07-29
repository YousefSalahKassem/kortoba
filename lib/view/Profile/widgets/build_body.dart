import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Favourite/screens/favorite_screen.dart';
import 'package:kortoba/view/Profile/widgets/header.dart';
import 'package:kortoba/view/Profile/widgets/profile_image.dart';
import 'package:kortoba/view/Profile/widgets/settings_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kortoba/view/Settings/screens/settings_screen.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Header(),
          SizedBox(height: context.height30 * 2),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingsItem(
                    text: AppLocalizations.of(context)!.editInformation,
                    icon: FontAwesomeIcons.pen,
                    onPressed: () {
                    }),
                SettingsItem(
                    text: AppLocalizations.of(context)!.settings,
                    icon: Icons.settings,
                    onPressed: () {
                     AppRoute.push(const SettingsScreen());
                    }),
                SettingsItem(
                    text: AppLocalizations.of(context)!.favorite,
                    icon: Icons.star,
                    onPressed: () {
                      AppRoute.push(const FavouriteScreen());
                    }),
              ],
            ),
          )
        ]),
        const ProfileImage(),
      ],
    );
  }
}
