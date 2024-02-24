class DataFurniture {
  List<Furniture> data;
  DataFurniture({required this.data});

  factory DataFurniture.fromJson(Map<String, dynamic> json) => DataFurniture(
      data:
          List<Furniture>.from(json["data"].map((x) => Furniture.fromJson(x))));
}

class Furniture {
  final String img;
  final String name;
  final String rate;
  final String price;
  final String? discountPrice;
  final String category;
  Furniture(
      {required this.img,
      required this.name,
      required this.rate,
      required this.price,
      required this.discountPrice,
      required this.category});
  factory Furniture.fromJson(Map<String, dynamic> json) {
    return Furniture(
        img: json['img'] ?? '',
        name: json['name'] ?? '',
        rate: json['rate'] ?? '',
        price: json['price'] ?? '',
        discountPrice: json['discount_price'] ?? '',
        category: json['category'] ?? '');
  }
}
