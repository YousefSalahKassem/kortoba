import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/model/local/local_post_model.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Favourite/widgets/header.dart';
import 'package:cached_network_image/cached_network_image.dart';
class LocalPostItem extends StatelessWidget {
  final LocalPostModel post;
  final String docId;

  const LocalPostItem({Key? key, required this.post, required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(context.height20),
      padding: EdgeInsets.all(context.height10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(context.height10),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: context.height10 * 1.2,
            spreadRadius: context.height10 * 0.5,
            offset: Offset(context.height10, context.height10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(docId: docId, post: post),
          SizedBox(
            height: context.height10,
          ),
          Container(
            height: context.height30 * 7,
            width: context.screenWidth,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(context.height10),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  post.image!,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: context.height10,
          ),
          TextApp(
            text: post.caption!,
            style: TextStyle(color: secondaryColor, fontSize: context.height20),
          )
        ],
      ),
    );
  }
}
