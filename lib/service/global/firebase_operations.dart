import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../../model/global/user_model.dart';

class FirebaseOperations with ChangeNotifier {
  final FirebaseFirestore _firestore;
  FirebaseOperations(this._firestore);

  addUserData(String uid, UserModel user) {
    _firestore.collection('users').doc(uid).set(user.toJson());
  }

  getUserData(String uid) {
    return _firestore.collection('users').doc(uid).get();
  }

  getCurrentUser() {
    return _firestore.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  }

}