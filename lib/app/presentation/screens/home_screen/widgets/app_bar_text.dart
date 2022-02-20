import 'package:flutter/material.dart';

Widget appBarText(String title, VoidCallback onTap) {
  return TextButton(
    onPressed: onTap,
    child: Text(
      title,
      style: const TextStyle(color: Colors.white, fontSize: 17),
    ),
  );
}