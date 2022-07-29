import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kortoba/modules/language_controller.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Authentication/screens/login_screen.dart';
import 'package:provider/provider.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.language,style:  TextStyle(fontWeight: FontWeight.bold,color: secondaryColor,fontSize: context.height20),),
          trailing: Icon(FontAwesomeIcons.earthAmericas,color: secondaryColor, size: context.height30,),
          onTap: (){
            chooseLanguage(context);
          },
        ),
        ListTile(
         title: Text(AppLocalizations.of(context)!.logout,style:  TextStyle(fontWeight: FontWeight.bold,color: secondaryColor,fontSize: context.height20),),
         trailing: Icon(Icons.logout,color: Colors.red, size: context.height30),
          onTap: (){
            FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false,
            );
          },
       ),
      ],
    );
  }

  chooseLanguage(context){
    var controller = Provider.of<ChangeLanguage>(context,listen: false);

    showModalBottomSheet(
        context: context,
        builder: (context){
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(context.height10),
            height: context.height30*2,
            width: context.screenWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(context.height10),
                topRight: Radius.circular(context.height10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.changeLanguage(const Locale('ar'));
                    Navigator.pop(context);
                  },
                  child: Text("العربية",style: TextStyle(fontWeight: FontWeight.bold,color: secondaryColor,fontSize: context.height20),),
                ),
                GestureDetector(
                  onTap: (){
                    controller.changeLanguage(const Locale('en'));
                    Navigator.pop(context);
                  },
                  child: Text("English",style: TextStyle(fontWeight: FontWeight.bold,color: secondaryColor,fontSize: context.height20),),
                ),
              ],
            ),
          );
        });
  }

}
