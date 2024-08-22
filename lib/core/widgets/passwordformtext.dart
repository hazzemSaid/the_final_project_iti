import 'package:flutter/material.dart';

Widget pfrom(
    {required String text,
    required String hint,
    required Function(String) onChanged,
    required bool seePassword,
    required Function() onPressed}) {
  return TextFormField(
    onChanged: onChanged,
    cursorColor: Colors.green,
    cursorErrorColor: Colors.green,
    obscureText: seePassword,
    decoration: InputDecoration(
      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(
          seePassword ? Icons.visibility_off : Icons.visibility,
          color: Colors.black,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      labelText: hint,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some $text';
      }
      return null;
    },
  );
}
