import 'package:eshop/features/authScreens/presentation/viewmodel/cubit/auth_cubit.dart';
import 'package:eshop/features/detailes/presentation/viewmodel/cubit_product/productshose_cubit.dart';
import 'package:eshop/features/authScreens/presentation/view/screens/forgetPassword.dart';
import 'package:eshop/features/authScreens/presentation/view/screens/sgin_in.dart';
import 'package:eshop/features/authScreens/presentation/view/screens/sginup.dart';
import 'package:eshop/features/favScreens/presenatation/view/screens/favScreen.dart';
import 'package:eshop/features/home/Home.dart';
import 'package:eshop/features/splash/presentation/view/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'features/bording/presentations/view/screens/Onboard1.dart';
import 'features/bording/presentations/view/screens/Onboard2.dart';

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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductshoseCubit(),
          ),
          BlocProvider(
            create: (context) => AuthCubit(),
          ),
        ],
        child: MaterialApp(routes: {
          '/': (context) => const SplashScreen(),
          '/Onboard1': (context) => const Onboard1(),
          '/Onboard2': (context) => const Onboard2(),
          '/sginin': (context) => SginIn(),
          '/sginup': (context) => SginUp(),
          '/forgot': (context) => const Forgetpassword(),
          '/home': (context) => Home(),
          '/fav': (context) => const Favscreen(),
        }));
  }
}
