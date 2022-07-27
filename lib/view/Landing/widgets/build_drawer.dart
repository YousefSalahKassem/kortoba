import 'package:flutter/material.dart';
import 'package:kortoba/modules/auth_controller.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:provider/provider.dart';


Drawer buildDrawer(BuildContext context) {
  AuthController controller = Provider.of<AuthController>(context);

  return Drawer(
    child: ListView(
      children: <Widget>[
         DrawerHeader(
          decoration: const BoxDecoration(
            color: drawerColor,
          ),
          child: FutureBuilder(
            future: controller.getCurrentUser(context),
              builder: (context,snapshot) => Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: avatar,
                      radius: context.height30,
                      child: controller.user.image!.isEmpty?const Icon(Icons.person,color: primaryColor,):Image.network(controller.user.image!),
                    ),
                    SizedBox(height: context.height10),
                    Text(
                      controller.user.name!.isEmpty?"Guest":controller.user.name!,
                      style: TextStyle(
                        fontSize: context.height20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ))
        ),
        ListTile(
          title:  Text(mainScreen,style: TextStyle(color: drawerColor, fontSize: context.height20, fontWeight: FontWeight.bold)),
          leading:  Icon(Icons.home,color: drawerColor, size: context.height20),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: context.height30),
          child:  Divider(thickness: context.height10/60),
        ),
        ListTile(
          title: Text(profile,style: TextStyle(color: drawerColor,fontSize: context.height20, fontWeight: FontWeight.bold),),
          leading: Icon(Icons.person,color: drawerColor, size: context.height20),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.height30),
          child:  Divider(thickness: context.height10/60),
        ),
        ListTile(
          title: Text(favourite,style: TextStyle(color: drawerColor,fontSize: context.height20, fontWeight: FontWeight.bold)),
          leading: Icon(Icons.bookmark,color: drawerColor, size: context.height20),
          onTap: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
        ),
      ],
    ),
  );
}