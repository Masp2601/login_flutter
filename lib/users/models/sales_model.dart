// To parse this JSON data, do
//
//     final product = productFromMap(jsonStrin

class Sales {
  Sales({
    this.id,
    this.total,
    this.items,
    this.cash,
    this.change,
    this.status,
    this.user_id,
    this.cliente_id,
    this.status_envio,
  });

  int? id;
  int? total;
  int? items;
  int? cash;
  int? change;
  String? status;
  int? user_id;
  int? cliente_id;
  String? status_envio;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        id: int.parse(json["id"]),
        total: int.parse(json["total"]),
        items: int.parse(json["items"]),
        cash: int.parse(json["cash"]),
        change: int.parse(json["change"]),
        status: json["status"],
        user_id: int.parse(json["user_id"]),
        cliente_id: int.parse(json["cliente_id"]),
        status_envio: json["status_envio"],
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
