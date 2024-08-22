import 'package:eshop/screens/authScreens/sgin_in.dart';
import 'package:flutter/material.dart';

class Home2screen extends StatelessWidget {
  const Home2screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[120],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 320,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 80, right: 10, left: 10),
              child: Stack(
                children: [
                  Positioned(
                    child: Image.asset(
                      'assets/images/item(6).png',
                      width: double.infinity,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: Image.asset(
                      'assets/images/point.png',
                    ),
                  ),
                  Positioned(
                    top: 260,
                    left: 320,
                    child: Image.asset(
                      'assets/images/point.png',
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: double.infinity,
            height: 12,
          ),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: const Column(
                children: [
                  Text(
                    "Follow Latest",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'AirbnbCereal',
                    ),
                  ),
                  Text(
                    "Styles  Shose",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      fontFamily: 'AirbnbCereal',
                    ),
                  ),
                ],
              )),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: Text(
                "There Are Many Beautiful And Attractive Plants To Your Room",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )),
          const SizedBox(
            width: double.infinity,
            height: 46,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SginIn(),
                ),
              );
            },
            child: Container(
              height: 70,
              width: 150,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 20, right: 10, left: 230),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF5B9EE1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
/*
this code must optimize later

 */