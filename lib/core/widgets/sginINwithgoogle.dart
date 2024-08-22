import 'package:flutter/material.dart';

InkWell sginINwithgooglebutton() {
  return InkWell(
    onTap: () {
      print("sgin in with google");
    },
    child: Container(
      height: 70,
      width: 380,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: const Color.fromARGB(255, 228, 226, 226),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 70,
          ),
          Image.asset(
            'assets/images/google.png',
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Sgin In with google',
            style: TextStyle(
              color: Color(0xfF1A2530),
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'AirbnbCereal',
            ),
          ),
        ],
      ),
    ),
  );
}
