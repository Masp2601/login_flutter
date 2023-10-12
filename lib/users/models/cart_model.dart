class Cart {
  int? id;
  double? price_sales;
  int? quantity;
  int? product_id;
  int? cliente_id;
  String? name;
  String? barcode;
  String? cost;
  double? price;
  String? stock;
  String? alerts;
  String? image;
  String? categoryid;
  String? descripcion;

  Cart({
    this.id,
    this.price_sales,
    this.quantity,
    this.product_id,
    this.cliente_id,
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

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: int.parse(json['id']),
        price_sales: double.parse(json["price"]),
        quantity: int.parse(json['quantity']),
        product_id: int.parse(json['product_id']),
        cliente_id: int.parse(json['cliente_id']),
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
}
