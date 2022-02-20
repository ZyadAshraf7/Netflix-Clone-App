import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'app_bar.dart';
import 'play_button_and_icon_box.dart';

class HomePosterAndAppBar extends StatelessWidget {
  const HomePosterAndAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: size.width,
          height: 400,
          child: Image.asset(
            "assets/images/poster.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.black54, Colors.black])),
          ),
        ),
        homeAppBar(context),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 23,
                  height: 23,
                  child: SvgPicture.asset(
                    "assets/images/icons/top10.svg",
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "#2 in Egypt Today",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 16),
            homePlayButtonAndIconsBox(),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
