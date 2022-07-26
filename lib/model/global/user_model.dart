class UserModel {
  String? name;
  String? email;
  String? id;
  String? image;
  String? background;

  UserModel({this.name, this.email, this.id, this.image, this.background});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      image: json['image'],
      background: json['background'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'image': image,
      'background': background,
    };
  }
}