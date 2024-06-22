class ProductModel {
  final int id;
  final String name;
  final num price;
  final String image;
  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });
  factory ProductModel.fromJson(product) {
    return ProductModel(
        id: product["id"],
        price: product["price"],
        image: product["image"],
        name: product["name"]);
  }

  @override
  bool operator ==(Object other) {
    if (other is! ProductModel) return false;
    if (name != other.name) return false;
    if (price != other.price) return false;
    if (image != other.image) return false;
    if (id != other.id) return false;
    return true;
  }
}
