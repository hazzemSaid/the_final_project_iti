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
            margin: const EdgeInsets.only(top: 65, right: 10, left: 10),
            child: Image.asset(
              fit: BoxFit.contain,
              'assets/images/item(6).png',
              width: 400,
            ),
          ),
          const SizedBox(
            width: double.infinity,
            height: 12,
          ),
          const Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                top: 10,
              ),
              child: const Text(
                "Follow Latest\n   Style Shoes",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 35,
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
                  fontSize: 30,
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
                "There Are Many Beautiful And\n Attractive Plants To Your Room",
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
                MaterialPageRoute(
                  builder: (context) => const SginIn(),
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