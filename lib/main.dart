import 'package:eshop/screens/authScreens/forgetPassword.dart';
import 'package:eshop/screens/authScreens/sgin_in.dart';
import 'package:eshop/screens/authScreens/sginup.dart';
import 'package:eshop/screens/splash/view/splashscreen.dart';
import 'package:flutter/material.dart';

import 'screens/home/home2Screen.dart';
import 'screens/home/homeScreen.dart';

void main() {
  runApp(const eshop());
}

class eshop extends StatelessWidget {
  const eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Homescreen(),
        '/home_2': (context) => const Home2screen(),
        '/sginin': (context) => const SginIn(),
        '/sginup': (context) => const SginUp(),
        '/forgot': (context) => const Forgetpassword(),
      },
    );
  }
}
