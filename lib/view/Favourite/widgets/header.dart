import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';
import '../../../components/text_app.dart';
import '../../../model/local/local_post_model.dart';
import '../../../modules/post_controller.dart';
import '../../../styles/colors.dart';

class Header extends StatelessWidget {
  final LocalPostModel post;
  final String docId;
  const Header({Key? key , required this.docId, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController postController = Provider.of<PostController>(context);
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
                  postController.sharePost(
                      post.caption!, post.image!);
                },
                icon: Icon(Icons.share,
                    color: avatar, size: context.height30)),
            SizedBox(
              height: context.height15,
            ),
          ],
        ),
        SizedBox(
          width: context.height10,
        ),
        SizedBox(
          width: context.height10,
        ),
        StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').doc(docId).snapshots(),
            builder: (context,snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              } else {
                List<dynamic> likes = snapshot.data!.data()!['likes'] as List<dynamic>;
                return Column(
                  children: [
                    SizedBox(
                      height: context.height30 * 1.3,
                      child: IconButton(
                          onPressed: () {
                            if (likes.contains(id)) {
                              likes.remove(id);
                              postController.removeLike(docId);
                            } else {
                              likes.add(id);
                              postController.addLike(docId);
                            }
                          },
                          icon: Icon(Icons.thumb_up,
                              color: likes.contains(id)?drawerColor:avatar,
                              size: context.height30)),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.height10 / 2,
                            vertical: context.height10 / 2),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius:
                          BorderRadius.circular(context.height10 / 2),
                        ),
                        child: Center(
                            child: TextApp(
                              text: likes.length.toString(),
                              style: TextStyle(
                                  color: primaryLight,
                                  fontSize: context.height10 * 1.1,
                                  fontWeight: FontWeight.w900),
                            )))
                  ],
                );
              }
            }),
      ],
    );
  }
}
