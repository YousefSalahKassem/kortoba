import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:io';


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

  fileFromImageUrl(image) async {
    final response = await http.get(Uri.parse(image));

    final documentDirectory = await getApplicationDocumentsDirectory();

    final file = File(join(documentDirectory.path, 'imagetest.png'));

    file.writeAsBytesSync(response.bodyBytes);

    return file.path;
  }

  sharePost( String caption, String image) async {
     Share.shareFiles(
       [
         await fileFromImageUrl(image)
       ],
       subject: caption,
       text: caption,
    );
  }

}
