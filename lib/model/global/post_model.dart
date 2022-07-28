
class PostModel {
  String? name;
  String? email;
  String? profilePicture;
  String? caption;
  String? image;
  String? time;
  List<dynamic>? likes;

  PostModel({this.name, this.email, this.profilePicture, this.caption, this.image, this.time, this.likes});

  factory PostModel.fromJson(Map json) {
    return PostModel(
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      profilePicture: json['profilePicture'] ?? "",
      caption: json['caption']??'',
      image: json['image']??'',
      time: json['time']??'',
      likes: json['likes']??[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name??'',
      'email': email??'',
      'profilePicture': profilePicture??'',
      'caption': caption??'',
      'image': image??'',
      'time': time??'',
      'likes': likes??[],
    };
  }
}