class ProductModel {
  String? id;
  String? title;
  String? subTitle;
  String? image;
  String? description;
  String? color;
  String? sized;
  int? price;
  String? category;
  String? publisher;

  ProductModel({
    this.title,
    this.subTitle,
    this.image,
    this.description,
    this.color,
    this.sized,
    this.price,
    this.id,
    this.category,
    this.publisher,
  });

  ProductModel.fromJson(Map<String, dynamic> data) {
    id = data["id"];
    title = data["title"];
    subTitle = data["subTitle"];
    image = data["image"];
    description = data["description"];
    color = data["color"];
    sized = data["sized"];
    price = data["price"];
    category = data["category"];
    publisher = data["publisher"];
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "subTitle": subTitle,
      "image": image,
      "description": description,
      "color": color,
      "sized": sized,
      "price": price,
      "category": category,
      "publisher": publisher,
    };
  }
}
