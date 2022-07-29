import 'package:kortoba/styles/strings.dart';

class LocalPostModel {
  String? id;
  String? caption;
  String? image;
  String? uid;
  String? favourite;
  String? likes;


  LocalPostModel({this.id, this.caption, this.image, this.favourite, this.likes, this.uid});

  factory LocalPostModel.fromJson(Map json) {
    return LocalPostModel(
      id: json['id']??'',
      caption: json['caption']??'',
      image: json['image']??'',
      favourite: json['favourite']??'',
      likes: json['likes']??'',
      uid: json['uid']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      columnId: id??'',
      columnCaption: caption??'',
      columnImage: image??'',
      columnFavourite: favourite??'',
      columnLikes: likes??'',
      columnUid: uid??'',
    };
  }
}

