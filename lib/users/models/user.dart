class User {
  int? id;
  String? name;
  String? email;
  String? lastname;
  String? lastname2;
  String? saldo;
  String? phone;
  String? address;
  String? document;
  String? password;

  User(
    this.id,
    this.name,
    this.lastname,
    this.lastname2,
    this.saldo,
    this.email,
    this.phone,
    this.address,
    this.document,
    this.password,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        int.parse(json["id"]),
        json["name"],
        json["last_name"],
        json["last_name2"],
        json['saldo'],
        json["email"],
        json["phone"],
        json["address"],
        json["document"],
        json["password"],
      );

  Map<String, dynamic> toJson() => {
        'id': id.toString(),
        'name': name,
        'last_name': lastname,
        'telefono_fijo': lastname2,
        'saldo': saldo.toString(),
        'email': email,
        'phone': phone,
        'address': address,
        'document': document,
        'password': password,
      };
}
