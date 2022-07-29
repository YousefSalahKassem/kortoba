
class PostModel {
  String? id;
  String? caption;
  String? image;
  String? time;
  List<dynamic>? likes;

  PostModel({this.id, this.caption, this.image, this.time, this.likes});

  factory PostModel.fromJson(Map json) {
    return PostModel(
      id: json['id']??'',
      caption: json['caption']??'',
      image: json['image']??'',
      time: json['time']??'',
      likes: json['likes']??[],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id??'',
      'caption': caption??'',
      'image': image??'',
      'time': time??'',
      'likes': likes??[],
    };
  }
}