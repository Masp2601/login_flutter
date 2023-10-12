// To parse this JSON data, do
//
//     final product = productFromMap(jsonStrin

class Product {
  Product({
    this.id,
    this.name,
    this.barcode,
    this.cost,
    this.price,
    this.stock,
    this.alerts,
    this.image,
    this.categoryid,
    this.descripcion,
  });

  int? id;
  String? name;
  String? barcode;
  String? cost;
  double? price;
  String? stock;
  String? alerts;
  String? image;
  String? categoryid;
  String? descripcion;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: int.parse(json["id"]),
        name: json["name"],
        barcode: json["barcode"],
        cost: json["cost"],
        price: double.parse(json["price"]),
        stock: json["stock"],
        alerts: json["alerts"],
        image: json["image"],
        categoryid: json["category_id"],
        descripcion: json["descripcion"],
      );

  /*Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "barcode": barcode,
        "cost": cost,
        "price": price,
        "stock": stock,
        "alerts": alerts,
        "image": image,
        "category_id": categoryid,
        "descripcion": descripcion,
      };*/
}
