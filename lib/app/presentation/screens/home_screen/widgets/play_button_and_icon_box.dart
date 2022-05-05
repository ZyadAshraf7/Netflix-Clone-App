import 'package:flutter/material.dart';
import 'package:netflix_app/app/presentation/widgets/bottom_sheet.dart';

import 'icon_box.dart';
import 'play_button.dart';

class PosterIconsBox extends StatelessWidget {
  const PosterIconsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          iconBox(title: "My List", iconPath: "assets/images/icons/plus.svg", onTap: (){
          }),
          const PlayButton(),
          iconBox(title: "Info", iconPath: "assets/images/icons/info.svg", onTap: (){
           // customBottomSheet(context: context);
          }),
        ],
      ),
    );
  }
}

