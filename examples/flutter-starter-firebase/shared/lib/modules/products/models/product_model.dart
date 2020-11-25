class Product {
  String id;
  String price;
  String name;
  String img;

  Product({this.id, this.price, this.name, this.img});

  Product.fromMap(Map snapshot, String id)
      : id = id ?? '',
        price = snapshot['price'] ?? '',
        name = snapshot['name'] ?? '',
        img = snapshot['img'] ?? '';

  toJson() {
    return {
      "price": price,
      "name": name,
      "img": img,
    };
  }
}
