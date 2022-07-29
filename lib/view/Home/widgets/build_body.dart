import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/components/loading_post.dart';
import 'package:shimmer/shimmer.dart';
import 'package:kortoba/model/global/post_model.dart';
import 'package:kortoba/modules/post_controller.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/view/Home/widgets/post_item.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostController controller = PostController();

    return SizedBox(
        height: context.screenHeight,
        width: context.screenWidth,
        child: StreamBuilder(
            stream: controller.getAllPosts(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Shimmer.fromColors(
                    baseColor: Colors.grey.shade500,
                    highlightColor: Colors.grey.shade500,
                    child: const LoadingPost());
              } else {
                return ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot snapshot) {
                  return PostItem(
                    post: PostModel.fromJson(
                        snapshot.data() as Map<String, dynamic>),
                    docId: snapshot.id,
                  );
                }).toList());
              }
            }));
  }
}
