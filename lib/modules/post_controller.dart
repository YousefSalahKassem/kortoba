import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_share/flutter_share.dart';

class PostController with ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool liked = false;

  Stream<QuerySnapshot> getAllPosts() {
    return _fireStore.collection('posts').orderBy('time',descending: true).snapshots();
  }

  addLike(String postId) {
    _fireStore.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayUnion([
        FirebaseAuth.instance.currentUser!.uid
      ])
    });
  }

  removeLike(String postId) {
    _fireStore.collection('posts').doc(postId).update({
      'likes': FieldValue.arrayRemove([
        FirebaseAuth.instance.currentUser!.uid
      ])
    });
  }

  Future<void> sharePost(BuildContext context, String caption, String image) async {
    await FlutterShare.share(
      title: caption,
      text: caption,
      linkUrl: image,
    );
  }

}
