import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/modules/post_controller.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:provider/provider.dart';
import '../../../model/global/post_model.dart';
import '../../../modules/auth_controller.dart';

class PostItem extends StatelessWidget {
  final PostModel post;
  final String docId;
  const PostItem({Key? key, required this.post,required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthController controller = Provider.of<AuthController>(context);
    PostController postController = Provider.of<PostController>(context);
    String id = FirebaseAuth.instance.currentUser!.uid;
    return Container(
      margin: EdgeInsets.all(context.height20),
      padding: EdgeInsets.all(context.height10),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(context.height10),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: context.height10*1.2,
            spreadRadius: context.height10*0.5,
            offset: Offset(context.height10, context.height10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FutureBuilder(
                  future: controller.getUserData(context, post.id!),
                  builder: (context,snapshot){
                    if(snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                       return Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: context.height20*1.2,
                              child: Icon(Icons.person,color: avatar,size: context.height30,)
                          ),
                          SizedBox(width: context.height10,),
                          TextApp(text: controller.user.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: context.height15,color: secondaryColor),),
                        ],
                      );
                    }
                  }),
              const Spacer(),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.share,color: avatar,size: context.height30)),
                  SizedBox(height: context.height15,),

                ],
              ),
              SizedBox(width: context.height10,),
              Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: avatar,size: context.height30)),
                  SizedBox(height: context.height15,),
                ],
              ),
              SizedBox(width: context.height10,),
              Column(
                children: [
                  StreamBuilder(
                      stream: postController.getAllLikes(context, docId),
                      builder: (context, dynamic snapshot){
                        if(!snapshot.hasData) {
                          return const CircularProgressIndicator();
                        }
                        else{
                          List<dynamic> likes = snapshot.data!.docs.map((doc)=>doc.data()!['id']).toList();
                          return  SizedBox(
                            height: context.height30*1.3,
                            child: IconButton(
                                onPressed: (){
                                  if(likes.contains(id)){
                                    postController.unLike(context, docId, id, id);
                                  }
                                  else{
                                    postController.addLike(context,
                                        docId,
                                        FirebaseAuth.instance.currentUser!.uid,
                                        FirebaseAuth.instance.currentUser!.uid);
                                  }
                                },
                                icon: Icon(
                                    Icons.thumb_up,
                                    color: likes.contains(id)?drawerColor:avatar,
                                    size: context.height30
                                )
                            ),
                          );
                        }
                      }),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: context.height10/2,vertical: context.height10/2),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(context.height10/2),
                    ),
                    child: StreamBuilder(
                        stream: postController.getAllLikes(context, docId),
                        builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
                          if(!snapshot.hasData) {
                            return const CircularProgressIndicator();
                          }
                          else{
                            int likes = snapshot.data!.docs.length;
                            return Center(
                                child: TextApp(
                                  text: likes.toString(),
                                  style: TextStyle(
                                      color: primaryLight,
                                      fontSize: context.height10*1.1,
                                      fontWeight: FontWeight.w900),
                                )
                            );
                          }
                        })
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: context.height10,),
          Container(
            height: context.height30*7,
            width: context.screenWidth,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(context.height10),
              image: DecorationImage(
                image: NetworkImage(post.image!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: context.height10,),
          TextApp(text: post.caption!, style: TextStyle(color: secondaryColor,fontSize: context.height20),)
        ],
      ),
    );
  }
}
