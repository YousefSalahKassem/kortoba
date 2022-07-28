import 'package:kortoba/styles/strings.dart';

class LocalPostModel {
  String? id;
  String? caption;
  String? image;
  String? name;
  String? profileImage;
  String? email;
  String? favourite;
  String? likes;

  LocalPostModel({this.id, this.caption, this.image, this.name, this.favourite, this.profileImage, this.email, this.likes});

  factory LocalPostModel.fromJson(Map json) {
    return LocalPostModel(
      id: json['id']??'',
      caption: json['caption']??'',
      image: json['image']??'',
      name: json['name']??'',
      favourite: json['favourite']??'',
      profileImage: json['profileImage']??'',
      email: json['email']??'',
      likes: json['likes']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      columnId: id??'',
      columnCaption: caption??'',
      columnImage: image??'',
      columnName: name??'',
      columnFavourite: favourite??'',
      columnProfileImage: profileImage??'',
      columnEmail: email??'',
      columnLikes: likes??'',
    };
  }
}

