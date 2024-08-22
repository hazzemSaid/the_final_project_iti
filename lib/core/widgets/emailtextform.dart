import 'package:flutter/material.dart';

Widget Tfrom(
    {required String text,
    required String hint,
    required Function(String) onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    cursorColor: Colors.green,
    cursorErrorColor: Colors.green,
    decoration: InputDecoration(
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
