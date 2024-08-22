import 'package:flutter/material.dart';

class Labeltext extends StatelessWidget {
  String text;
  Labeltext({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 4,
        bottom: 10,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: 'AirbnbCereal',
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
