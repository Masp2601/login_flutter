import 'package:flutter/material.dart';
import 'package:latin_food_app/users/authentication/login_view.dart';

class AnimatedCortinaSplash extends StatefulWidget {
  const AnimatedCortinaSplash({super.key});

  @override
  State<AnimatedCortinaSplash> createState() => _AnimatedCortinaSplashState();
}

class _AnimatedCortinaSplashState extends State<AnimatedCortinaSplash> {
  bool isBackLogin = true;
  initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      isBackLogin = false;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return isBackLogin
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Center(child: Text('Cargando...')),
              ],
            ),
          )
        : const LoginScreen();
  }
}
