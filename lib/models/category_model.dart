class CategoryModel {
  String? name;
  String? image;
  CategoryModel({
    required this.name,
    required this.image,
  });
  CategoryModel.fromJson(Map<String, dynamic>? data) {
    if (data == null) {
      return;
    }
    name = data["name"];
    image = data["image"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
    };
  }
}
