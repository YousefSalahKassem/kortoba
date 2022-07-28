import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Favourite/screens/favorite_screen.dart';
import 'package:kortoba/view/Profile/widgets/header.dart';
import 'package:kortoba/view/Profile/widgets/profile_image.dart';
import 'package:kortoba/view/Profile/widgets/settings_item.dart';
import '../../../styles/strings.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Header(),
            SizedBox(height: context.height30*2),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.height30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingsItem(text: editInformation, icon: FontAwesomeIcons.pen, onPressed: (){}),
                  SettingsItem(text: settings, icon: Icons.settings, onPressed: (){}),
                  SettingsItem(text: favourite, icon: Icons.star, onPressed: (){AppRoute.push(const FavouriteScreen());}),
                ],
              ),
            )
          ]
        ),
        const ProfileImage(),
      ],
    );
  }
}
