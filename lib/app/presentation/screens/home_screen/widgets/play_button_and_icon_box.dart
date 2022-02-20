import 'package:flutter/material.dart';

import 'icon_box.dart';
import 'play_button.dart';

Widget homePlayButtonAndIconsBox(){
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconBox(title: "My List", iconPath: "assets/images/icons/plus.svg", onTap: (){}),
        playButton(),
        iconBox(title: "Info", iconPath: "assets/images/icons/info.svg", onTap: (){}),
      ],
    ),
  );
}