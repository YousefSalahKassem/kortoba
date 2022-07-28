import 'package:flutter/material.dart';
import 'package:kortoba/modules/favorite_controller.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Favourite/widgets/post_item.dart';
import 'package:provider/provider.dart';

import '../../Home/widgets/post_item.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteController controller = Provider.of<FavouriteController>(context);
    return SizedBox(
      height: context.screenHeight,
      width: context.screenWidth,
      child: ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context,index) {
            return LocalPostItem(
              post: controller.posts[index],
              docId: controller.posts[index].id!,
            );
          }),
    );
  }
}
