import 'package:eshop/cubit/auth_cubit.dart';
import 'package:eshop/screens/authScreens/forgetPassword.dart';
import 'package:eshop/screens/authScreens/sgin_in.dart';
import 'package:eshop/screens/authScreens/sginup.dart';
import 'package:eshop/screens/home/Home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'screens/bording/Onboard1.dart';
import 'screens/bording/Onboard2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const eshop());
}

class eshop extends StatelessWidget {
  const eshop({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          home: Home(),
          routes: {
            //  '/': (context) => const SplashScreen(),
            '/Onboard1': (context) => const Onboard1(),
            '/Onboard2': (context) => const Onboard2(),
            '/sginin': (context) => SginIn(),
            '/sginup': (context) => SginUp(),
            '/forgot': (context) => const Forgetpassword(),
            '/home': (context) => Home(),
          },
        ));
  }
}
