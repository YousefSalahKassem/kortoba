import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../components/button_app.dart';
import '../../../model/local/boarding_model.dart';
import '../../../modules/boarding_controller.dart';
import '../../../styles/images.dart';
import '../widgets/boarding_item.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<BoardingController>(context);
    final List<Boarding> boardings = [
      Boarding(
        title: AppLocalizations.of(context)!.welcome,
        image: splash1,
      ),
      Boarding(
        title: AppLocalizations.of(context)!.secondSplash,
        image: splash2,
      ),
      Boarding(
        title: AppLocalizations.of(context)!.thirdSplash,
        image: splash3,
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.splashImage*2.8,
            child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.setCurrentIndex(index),
                itemCount: boardings.length,
                itemBuilder: (context, index) =>
                    BoardingItem(item: boardings[index], index: index)),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                boardings.length,
                    (index) => controller.buildDot(index, context),
              ),
            ),
          ),
          SizedBox(
            height: context.height30
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: context.height20),
              child: ButtonApp(color: buttonColor, text: AppLocalizations.of(context)!.next, onPressed: (){
                controller.nextPage();
              }),
          ),
          SizedBox(
              height: context.height30
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
