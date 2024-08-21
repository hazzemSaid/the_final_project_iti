import 'package:eshop/screens/home/home2Screen.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[120],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 80, right: 10, left: 10),
            child: Image.asset(
              'assets/images/item(8).png',
              width: 400,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 90,
          ),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: const Text(
                "Start Journey ",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'AirbnbCereal',
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: Text(
                "with Nike ",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: 'AirbnbCereal',
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: Text(
                "Smart, Gorgeous & Fashionable Collection ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Home2screen()),
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
                  'Get Started',
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
