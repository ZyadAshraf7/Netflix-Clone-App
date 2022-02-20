import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
Widget socialMediaLogin() {
  return SizedBox(
    width: 310,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("assets/images/icons/google.svg"),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset("assets/images/icons/facebook.svg"),
          ),
        ],
      ),
    ),
  );
}
