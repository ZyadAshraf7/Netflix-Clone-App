import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
Widget doesHaveAccount({required String title, required String subtitle, required VoidCallback function}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      GestureDetector(
        onTap: function,
        child: Text(
          subtitle,
          style: const TextStyle(color: AppTheme.redPrimaryColor, fontSize: 15),
        ),
      ),
    ],
  );
}
