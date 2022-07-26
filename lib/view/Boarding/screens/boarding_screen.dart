import 'package:flutter/material.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:provider/provider.dart';

import '../../../components/button_app.dart';
import '../../../modules/boarding_controller.dart';
import '../widgets/boarding_item.dart';

class BoardingScreen extends StatelessWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<BoardingController>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: context.splashImage*2.8,
            child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: (index) => controller.setCurrentIndex(index),
                itemCount: controller.boardings.length,
                itemBuilder: (context, index) =>
                    BoardingItem(controller: controller, index: index)),
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.boardings.length,
                    (index) => controller.buildDot(index, context),
              ),
            ),
          ),
          SizedBox(
            height: context.height30
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: context.height20),
              child: ButtonApp(color: buttonColor, text: next, onPressed: (){
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
