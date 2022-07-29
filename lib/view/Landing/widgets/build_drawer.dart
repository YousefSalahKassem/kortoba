import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Favourite/screens/favorite_screen.dart';
import 'package:kortoba/view/Home/screens/home_screen.dart';
import 'package:kortoba/view/Profile/screens/profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


Drawer buildDrawer(BuildContext context) {

  return Drawer(
    child: ListView(
      children: <Widget>[
         DrawerHeader(
          decoration: const BoxDecoration(
            color: drawerColor,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: avatar,
                  radius: context.height30,
                  child: const Icon(Icons.person,color: primaryColor,),
                ),
                SizedBox(height: context.height10),
                Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: TextStyle(
                    fontSize: context.height20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ),
         ListTile(
          title:  Text(AppLocalizations.of(context)!.mainScreen,style: TextStyle(color: drawerColor, fontSize: context.height20, fontWeight: FontWeight.bold)),
          leading:  Icon(Icons.home,color: drawerColor, size: context.height20),
          onTap: () {
            AppRoute.push(const HomeScreen());
          },
        ),
         Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height30),
          child:  Divider(thickness: context.height10/60),
        ),
         ListTile(
          title: Text(AppLocalizations.of(context)!.profile,style: TextStyle(color: drawerColor,fontSize: context.height20, fontWeight: FontWeight.bold),),
          leading: Icon(Icons.person,color: drawerColor, size: context.height20),
          onTap: () {
            AppRoute.push(const ProfileScreen());
          },
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: context.height30),
          child:  Divider(thickness: context.height10/60),
        ),
         ListTile(
          title: Text(AppLocalizations.of(context)!.favorite,style: TextStyle(color: drawerColor,fontSize: context.height20, fontWeight: FontWeight.bold)),
          leading: Icon(Icons.bookmark,color: drawerColor, size: context.height20),
          onTap: () {
            AppRoute.push(const FavouriteScreen());
          },
        ),
      ],
    ),
  );
}