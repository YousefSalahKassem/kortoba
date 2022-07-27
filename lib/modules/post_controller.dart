import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PostController with ChangeNotifier {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  bool liked = false;

  Stream<QuerySnapshot> getAllPosts() {
    return _fireStore.collection('posts').snapshots();
  }

  Future addLike(BuildContext context, String postId, String subDocId,String id) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(subDocId)
        .set({
      'likes': FieldValue.increment(1),
      'id': id,
    });
  }

  unLike(BuildContext context, String postId, String subDocId,String id) async {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(subDocId).delete();
  }

  Stream<QuerySnapshot> getAllLikes(BuildContext context, String postId) {
    return FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .snapshots();
  }
}
