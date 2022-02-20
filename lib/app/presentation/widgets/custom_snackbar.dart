import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

Object customSnackBar(BuildContext context, String title) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(title),
      backgroundColor: AppTheme.redPrimaryColor,
      duration: const Duration(
        milliseconds: 500,
      ),
    ),
  );
}
