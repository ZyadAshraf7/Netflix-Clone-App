import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

import 'app_bar_text.dart';

Widget homeAppBar(BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Positioned(
    top: 40,
    child: SizedBox(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            "assets/images/icons/netflix-n.svg",
            width: 20,
            height: 40,
            color: AppTheme.redPrimaryColor,
          ),
          appBarText("TV Shows", () { }),
          appBarText("Movies", () { }),
          appBarText("My List", () { }),
        ],
      ),
    ),
  );
}