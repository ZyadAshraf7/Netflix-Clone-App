import 'package:flutter/material.dart';

Widget separator() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 2,
        width: 80,
        color: Colors.white,
      ),
      const SizedBox(width: 16),
      const Text(
        "Login with",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      const SizedBox(width: 16),
      Container(
        height: 2,
        width: 80,
        color: Colors.white,
      ),
    ],
  );
}