import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/model/local/boarding_model.dart';
import 'package:kortoba/styles/dimensions.dart';
import '../../../styles/colors.dart';

class BoardingItem extends StatelessWidget {
  final Boarding item;
  final int index;
  const BoardingItem({Key? key,required this.item, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height20),
        SvgPicture.asset(
          item.image!,
          width: context.screenWidth/1.5,
          height: context.splashImage*2.4,
        ),
        TextApp(text: item.title!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: context.height20*1.2,color: secondaryColor),textAlign: TextAlign.center, )
      ],
    );
  }
}
