import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:latin_food_app/api_connection/api_connection.dart';
import 'package:latin_food_app/color.dart';
import 'package:latin_food_app/users/authentication/register_view.dart';
import 'package:latin_food_app/users/models/user.dart';
import 'package:latin_food_app/users/screens/home_page.dart';
import 'package:latin_food_app/users/userPreferences/user_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:latin_food_app/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //base de datos conexion
  var formkey = GlobalKey<FormState>();
  //controladores
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //login con firebase
  validateForm() {
    if (!_emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "The email is not valid...");
    } else if (_passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "password is required...");
    } else {
      loginUserNow();
    }
  }

  loginUserNow() async {
    try {
      var res = await http.post(
        Uri.parse(API.login),
        body: {
          "email": _emailController.text.trim(),
          "password": _passwordController.text.trim(),
        },
      );

      if (res.statusCode == 200) {
        var resBodylogin = jsonDecode(res.body);
        if (resBodylogin['success'] == true) {
          Fluttertoast.showToast(msg: "You are logged-in Successfully");

          User userInfo = User.fromJson(resBodylogin["userData"]);
          //save user info
          await RememberUserPrefs.storeUserInfo(userInfo);

          Future.delayed(Duration(milliseconds: 2000), () {
            Get.to(HomePage());
          });
        } else {
          Fluttertoast.showToast(
              msg:
                  "Incorrect credentials. \nPlease write correct password or email and Try Again.");
        }
      }
    } catch (errorMsg) {
      print("Error ::" + errorMsg.toString());
    }
  }

  /*Future<dynamic> loginUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, please wait...",
          );
        });
    try {
      final User? firebaseUser = (await fAuth
              .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      )
              .catchError((msg) {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Error: " + msg.toString());
      }))
          .user;
      if (firebaseUser != null) {
        currentFirebaseUser = firebaseUser;
        Fluttertoast.showToast(msg: "Login successful...");
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => AnimatedCortina()));
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "An error occurred while logging in...");
      }
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: UI.getNombreAgencia(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Image.asset(
                  "assets/images/user.png",
                  width: 240,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Bienvenido',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "SanFrancisco_Italic",
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 26, bottom: 10),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (val) =>
                              val == "" ? "please write email" : null,
                          decoration: UI().textInputDecoration(
                            UI.getIcon("personBorder", Colors.grey, null),
                            "Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          validator: (val) =>
                              val == "" ? "please write password" : null,
                          obscureText: true,
                          decoration: UI().textInputDecoration(
                            UI.getIcon("password", Colors.grey, null),
                            "Password",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ],
                    ),
                  ),
                ),
                /*Row(
                  children: [
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPwScreen()));
                        },
                        child: UI.getText(
                            "Forgot your password?",
                            13,
                            Colors.black,
                            "SanFrancisco_Italic",
                            null,
                            false,
                            false)),
                  ],
                ),*/
                const SizedBox(
                  height: 30,
                ),
                UI.getButton("Login", 20, 350, 50, () {
                  Get.to(HomePage()); 
                  /*if (formkey.currentState!.validate()) {
                    //validateForm();
                    Get.to(DashboardOfFragments());        
                  }*/
                }),
                const SizedBox(
                  height: 30,
                ),
                _getTextRich(context),
                const SizedBox(
                  height: 30,
                ),
                //_getTextRichAdmin(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _getTextRich(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          const TextSpan(
              text: 'No tienes cuenta?  ',
              style: TextStyle(fontFamily: "SanFrancisco_Bold", fontSize: 14)),
          TextSpan(
              text: 'crea una cuenta',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterView()));
                },
              style: TextStyle(
                  color: colorPrincipal,
                  fontFamily: "SanFrancisco_Bold",
                  fontSize: 14)),
        ],
      ),
    );
  }
}
