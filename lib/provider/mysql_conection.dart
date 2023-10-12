import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:latin_food_app/users/models/category.dart';

import 'package:latin_food_app/users/models/product_model.dart';
import 'package:latin_food_app/users/models/user_model.dart';
import 'package:mysql_client/mysql_client.dart';

// ignore: camel_case_types
class mySqlConection extends ChangeNotifier {
  List<Product> products = [];
  List<User1> users = [];
  List<Categoria> category = [];

  mySqlConection() {
    mySQLConenct();
  }

  Future mySQLConenct() async {
    final conn = await MySQLConnection.createConnection(
      host: "51.161.35.133",
      port: 3306,
      userName: "remoto",
      password: "OyarceGroup2023",
      databaseName: "b3",
    );
    print("Entro");
    /* await conn.connect();
    final resultUsers = await conn.execute('SELECT * FROM users');
    for (final row in resultUsers.rows) {
      users.add(User1.fromResult(row));
      notifyListeners();
    }*/
    // ignore: avoid_print

    print(users);

    /*final resultProductos = await conn.execute('SELECT * FROM products');
    for (final row in resultProductos.rows) {
      products1.add(Product1.fromResult(row));
      notifyListeners();
    }*/

    print(products);

    //categorias
    /*final resultCategory = await conn.execute('SELECT * FROM categories');
    for (final row in resultCategory.rows) {
      category.add(Categoria.fromResult(row));
      notifyListeners();
    }*/

    print(category);

    //await conn.close();
  }
}
