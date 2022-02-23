class UserModel {
  late String uid;
  late String email;
  late String name;
  late String picture;
  late bool isPublisher;
  late int phone;

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.picture,
    required this.isPublisher,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic>? data) {
    if (data == null) {
      return;
    }
    uid = data["uid"];
    email = data["email"];
    phone = data["phone"];
    name = data["name"];
    picture = data["picture"];
    isPublisher = data["isPublisher"];
  }
  Map<String, dynamic> toMap() {
    return {
      "uid": this.uid,
      "email": this.email,
      "phone": this.phone,
      "name": this.name,
      "picture": this.picture,
      "isPublisher": this.isPublisher,
    };
  }
}
