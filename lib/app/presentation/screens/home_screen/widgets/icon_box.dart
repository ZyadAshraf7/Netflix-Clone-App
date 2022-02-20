import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconBox({required String title, required String iconPath, required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        SvgPicture.asset(iconPath,width: 24,height: 24,),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    ),
  );
}