import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latin_food_app/api_connection/api_connection.dart';
import 'package:latin_food_app/color.dart';
import 'package:latin_food_app/users/screens/home_page.dart';
import 'package:latin_food_app/users/screens/splashScreen/splash_view.dart';
import 'package:latin_food_app/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  //controladores
  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _lastname2Controller = TextEditingController();
  final _emailController = TextEditingController();
  final _celController = TextEditingController();
  final _addressController = TextEditingController();
  final _documentController = TextEditingController();
  final _passwordController = TextEditingController();

  validateUserEmail() async {
    try {
      var res = await http.post(
        Uri.parse(API.validateEmail),
        body: {
          'email': _emailController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodyOfValidateEmail = jsonDecode(res.body);

        if (resBodyOfValidateEmail['emailFound'] == true) {
          Fluttertoast.showToast(
              msg: "Email is alreadyin someone else use. try another email");
        } else {
          //register y save new user in db
          registerAndSavedUserRecord();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  registerAndSavedUserRecord() async {
    User userModel = User(
      1,
      _nameController.text.trim(),
      _lastnameController.text.trim(),
      _lastname2Controller.text.trim(),
      "0",
      _emailController.text.trim(),
      _celController.text.trim(),
      _addressController.text.trim(),
       _documentController.text.trim(),
      _passwordController.text.trim(),
    );

    try {
      var res = await http.post(
        Uri.parse(API.signUp),
        body: userModel.toJson(),
      );

      if (res.statusCode == 200) {
        var resBodyOfSignUp = jsonDecode(res.body);
        if (resBodyOfSignUp['success'] == true) {
          Fluttertoast.showToast(
              msg: "Congratulations, you are SignUp Successfully");

          setState(() {
            _nameController.clear();
            _lastnameController.clear();
            _lastname2Controller.clear();
            _emailController.clear();
            _celController.clear();
            _addressController.clear();
            _documentController.clear();
            _passwordController.clear();
          });

          Future.delayed(Duration(milliseconds: 2000), () {
            Get.to(AnimatedCortinaSplash());
            //AnimatedCortina()
            //DashboardOfFragments()
          });
        } else {
          Fluttertoast.showToast(msg: "Error Occured, Try Again.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: UI.getNombreAgencia(),
        body: SingleChildScrollView(child: Form(child: getUIForm())));
  }

  Widget getUIForm() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            UI.getLeading(context, colorPrincipal),
            const SizedBox(
              height: 10,
            ),
            UI.getText("Crear cuenta", 34, const Color.fromARGB(255, 0, 0, 0),
                "SanFrancisco_Italic", FontWeight.w500, false, false),
            UI.getText(
                "Crear cuenta nueva",
                13,
                const Color.fromARGB(255, 141, 141, 141),
                "SanFrancisco_Italic",
                null,
                false,
                false),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Nombre',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _nameController.clear,
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _lastnameController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Apellido',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _nameController.clear,
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _lastname2Controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Telefono fjo',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _nameController.clear,
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Correo Electrónico',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _emailController.clear,
                  icon: Icon(
                    Icons.email_outlined,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _celController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Celular',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _celController.clear,
                  icon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Dirección',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _addressController.clear,
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _documentController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Documento',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _documentController.clear,
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: 'Contraseña',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: IconButton(
                  onPressed: _passwordController.clear,
                  icon: Icon(
                    Icons.password,
                    color: Color.fromARGB(255, 250, 89, 2),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 240, 240, 240), width: 32.0),
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            UI.getButton("Crear cuenta", 20, 300, 50, () {
              Get.to(HomePage()); 
              /*if (formKey.currentState!.validate()) {
                //validateUserEmail();
                Get.to(DashboardOfFragments());  
              }*/
            }),
            const SizedBox(
              height: 18,
            ),
            _getTextRich(),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  _getTextRich() {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          const TextSpan(
              text: 'Ya tienes una cuenta?   ',
              style: TextStyle(fontFamily: "SanFrancisco_Bold")),
          TextSpan(
              text: 'Inicio Sesión',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },
              style: TextStyle(
                  color: colorPrincipal, fontFamily: "SanFrancisco_Bold")),
        ],
      ),
    );
  }
}
