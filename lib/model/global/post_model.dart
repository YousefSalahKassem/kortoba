class PostModel {
  String? id;
  String? caption;
  String? image;
  String? time;

  PostModel({this.id, this.caption, this.image, this.time});

  factory PostModel.fromJson(Map json) {
    return PostModel(
      id: json['id']??'',
      caption: json['caption']??'',
      image: json['image']??'',
      time: json['time']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id??'',
      'caption': caption??'',
      'image': image??'',
      'time': time??'',
    };
  }
}