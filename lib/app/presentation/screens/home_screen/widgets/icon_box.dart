import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

Widget iconBox({required String title, required String iconPath, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      children: [
        SvgPicture.asset(iconPath,width: 24,height: 24,color: AppTheme.smokeWhiteColor,),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 12, color: Colors.white60),
        ),
      ],
    ),
  );
}