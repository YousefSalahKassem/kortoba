import 'package:flutter/cupertino.dart';
import 'package:kortoba/service/local/favourite_database.dart';

import '../model/local/local_post_model.dart';

class FavouriteController with ChangeNotifier{
  FavouriteDatabase dbHelper = FavouriteDatabase.db;

  List<LocalPostModel> posts =[];

  FavouriteController(){
    init();
    getPosts();
  }

  init() async {
    await dbHelper.initDatabase();
    getPosts();
    notifyListeners();
  }

  getPosts() async {
    final List<LocalPostModel> allPosts = await dbHelper.getPosts();
    posts.clear();
    posts.addAll(allPosts);
    notifyListeners();
  }

  addPost(LocalPostModel post) async {
    await dbHelper.insertPost(post);
    getPosts();
    notifyListeners();
  }

  deletePost(String id) async {
    await dbHelper.deletePost(id);
    getPosts();
    notifyListeners();
  }

  updatePost(LocalPostModel post) async {
    await dbHelper.updatePost(post);
    getPosts();
    notifyListeners();
  }

  isSave(String id) {
    getPosts();
    for (var i = 0; i < posts.length; i++) {
      if (posts[i].id == id) {
        return true;
      }
    }
    return false;
  }
}