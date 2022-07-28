import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kortoba/components/button_app.dart';
import 'package:kortoba/components/text_app.dart';
import 'package:kortoba/components/text_button.dart';
import 'package:kortoba/model/global/post_model.dart';
import 'package:kortoba/modules/auth_controller.dart';
import 'package:kortoba/styles/colors.dart';
import 'package:kortoba/styles/dimensions.dart';
import 'package:kortoba/styles/strings.dart';
import 'package:kortoba/util/routes.dart';
import 'package:kortoba/view/Home/widgets/write_comment.dart';
import 'package:provider/provider.dart';
import '../../model/global/user_model.dart';

class FirebaseOperations with ChangeNotifier {
  final FirebaseFirestore _firestore;

  TextEditingController caption = TextEditingController();

  File uploadPostImage = File('');

  File get getUploadPostImage => uploadPostImage;

  set setUploadPostImage(File value) => uploadPostImage = value;

  late String uploadPostImageUrl;

  String get getUploadPostImageUrl => uploadPostImageUrl;

  final picker = ImagePicker();
  late UploadTask imagePostUploadTask;

  FirebaseOperations(this._firestore);

  addUserData(String uid, UserModel user) {
    _firestore.collection('users').doc(uid).set(user.toJson());
  }

  Future uploadPostData(String posId, PostModel data) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(posId)
        .set(data.toJson());
  }

  Future updatePost(String postId, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .update(data);
  }

  Future pickUploadPostImage(BuildContext context, ImageSource source) async {
    final uploadPostImageVal = await picker.getImage(source: source);
    uploadPostImageVal == null
        ? print('Select image')
        : uploadPostImage = File(uploadPostImageVal.path);

    uploadPostImageToFirebase(uploadPostImage);
    uploadPostImage != null
        ? showPostImage(context)
        : print('Image upload error');
    notifyListeners();
  }

  Future uploadPostImageToFirebase(File uploadPostImage) async {
    Reference imageReference = FirebaseStorage.instance
        .ref()
        .child('posts/${uploadPostImage.path}/${TimeOfDay.now()}');
    imagePostUploadTask = imageReference.putFile(uploadPostImage);
    await imagePostUploadTask.whenComplete(() {});
    imageReference.getDownloadURL().then((value) {
      uploadPostImageUrl = value;
      print(value);
    });
    notifyListeners();
  }

  showPostImage(BuildContext context) {
    showDialog(
        context: context,
        barrierColor: Colors.grey.shade600,
        builder: (context) {
          AuthController controller = Provider.of<AuthController>(context);
          return Dialog(
            insetPadding: EdgeInsets.all(context.height15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(context.height15)),
            backgroundColor: primaryColor,
            child: SizedBox(
                height: context.screenHeight * 0.5,
                width: context.screenWidth,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: context.screenHeight * 0.2,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(context.height10),
                      decoration: BoxDecoration(
                        color: avatarLight,
                        borderRadius: BorderRadius.circular(context.height15),
                      ),
                      child: uploadPostImage.path.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    pickUploadPostImage(
                                        context, ImageSource.gallery);
                                  },
                                  icon: Icon(
                                    Icons.camera_alt,
                                    size: context.height30 * 1.5,
                                    color: cameraIcon,
                                  ),
                                ),
                                Text(
                                  uploadImage,
                                  style: TextStyle(
                                      color: primaryLight,
                                      fontWeight: FontWeight.bold,
                                      fontSize: context.height20),
                                )
                              ],
                            )
                          : Image.file(
                              uploadPostImage,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(
                      height: context.height20,
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: context.height15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextApp(
                              text: writeComment,
                              style: TextStyle(
                                  color: commentLabel,
                                  fontSize: context.height20),
                            ),
                            WriteComment(
                              controller: caption,
                            )
                          ],
                        )),
                    const Spacer(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.height15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButtonApp(
                            text: ignore,
                            style: TextStyle(
                                color: buttonColor, fontSize: context.height20),
                            onPressed: () {
                              uploadPostImage = File('');
                              AppRoute.pop();
                            },
                          ),
                          SizedBox(
                            width: context.height15,
                          ),
                          ButtonApp(
                            color: buttonColor,
                            text: share,
                            onPressed: () {
                              uploadPostData(
                                  FirebaseAuth.instance.currentUser!.uid +
                                      DateTime.now().toString(),
                                  PostModel(
                                    name: controller.user.name,
                                    email: controller.user.email,
                                    profilePicture: controller.user.image,
                                    image: uploadPostImageUrl,
                                    caption: caption.text,
                                    time: Timestamp.now().toString(),
                                    likes: []
                                  )).whenComplete(() {
                                uploadPostImage = File('');
                                caption.clear();
                                AppRoute.pop();
                              }).whenComplete(() => AppRoute.pop());
                            },
                            width: context.height30 * 3,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height10,
                    ),
                  ],
                )),
          );
        });
  }
}
