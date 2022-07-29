import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';

import '../../../components/text_app.dart';
import '../../../model/global/post_model.dart';
import '../../../model/local/local_post_model.dart';
import '../../../modules/favorite_controller.dart';
import '../../../modules/post_controller.dart';
import '../../../styles/colors.dart';

class Header extends StatelessWidget {
  final PostModel post;
  final String docId;

  const Header({Key? key, required this.post, required this.docId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postController = Provider.of<PostController>(context);
    FavouriteController favoriteController =
        Provider.of<FavouriteController>(context);
    String id = FirebaseAuth.instance.currentUser!.uid;
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: primaryColor,
            radius: context.height20 * 1.2,
            child: Icon(
              Icons.person,
              color: avatar,
              size: context.height30,
            )),
        const Spacer(),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  postController.sharePost(post.caption!, post.image!);
                },
                icon: Icon(Icons.share, color: avatar, size: context.height30)),
            SizedBox(
              height: context.height15,
            ),
          ],
        ),
        SizedBox(
          width: context.height10,
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  if (favoriteController.isSave(docId)) {
                    favoriteController.deletePost(docId);
                  } else {
                    favoriteController.addPost(LocalPostModel(
                      uid: post.id!,
                      image: post.image!,
                      caption: post.caption!,
                      favourite: 'true',
                      id: docId,
                      likes: post.likes!.length.toString(),
                    ));
                  }
                },
                icon: Icon(Icons.bookmark,
                    color:
                        favoriteController.isSave(docId) ? drawerColor : avatar,
                    size: context.height30)),
            SizedBox(
              height: context.height15,
            ),
          ],
        ),
        SizedBox(
          width: context.height10,
        ),
        Column(
          children: [
            SizedBox(
              height: context.height30 * 1.3,
              child: IconButton(
                  onPressed: () {
                    if (post.likes!
                        .contains(FirebaseAuth.instance.currentUser!.uid)) {
                      postController.removeLike(docId);
                    } else {
                      postController.addLike(docId);
                    }
                  },
                  icon: Icon(Icons.thumb_up,
                      color: post.likes!.contains(id) ? drawerColor : avatar,
                      size: context.height30)),
            ),
            Container(
                padding: EdgeInsets.symmetric(
                    horizontal: context.height10 / 2,
                    vertical: context.height10 / 2),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(context.height10 / 2),
                ),
                child: Center(
                    child: TextApp(
                  text: post.likes!.length.toString(),
                  style: TextStyle(
                      color: primaryLight,
                      fontSize: context.height10 * 1.1,
                      fontWeight: FontWeight.w900),
                )))
          ],
        )
      ],
    );
  }
}
