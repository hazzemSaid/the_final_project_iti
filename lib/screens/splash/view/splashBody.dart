import 'package:eshop/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';

import '../../../constrain.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});
  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    animationSlidingtext();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    go_to_homeScreen();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        image: DecorationImage(
          image: AssetImage(spalshImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SlideTransition(
          position: animation,
          child: const Text(
            oxyBoots,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void animationSlidingtext() {
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: const Offset(0, 0.5),
    ).animate(controller);
    controller.forward();
  }

  void go_to_homeScreen() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homescreen()),
      );
    });
  }
}
