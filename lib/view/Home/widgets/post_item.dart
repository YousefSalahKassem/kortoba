import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Home/widgets/header.dart';
import '../../../model/global/post_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final String docId;

  const PostItem({Key? key, required this.post, required this.docId})
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
          Header(post: post, docId: docId),
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
