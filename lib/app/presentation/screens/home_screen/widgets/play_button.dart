import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget playButton() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xffc4c4c4),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/icons/play.svg",
              width: 18,
              height: 22,
            ),
            const SizedBox(width: 10),
            const Text(
              "Play",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    ),
  );
}
