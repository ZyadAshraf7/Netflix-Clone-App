import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

import 'app_bar_text.dart';

class HomeAppBar extends StatefulWidget {
   HomeAppBar({Key? key,required this.scrollOffset}) : super(key: key);
  double scrollOffset;
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 100;
    double opacity=0;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30).copyWith(top: 10),
        color: Colors.black.withOpacity((widget.scrollOffset/350).clamp(0, 0.8).toDouble()),
        //height: widget.scrollOffset<40?height:100,
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                child: widget.scrollOffset<100?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/images/icons/netflix-n.svg",
                      width: 20,
                      height: 40,
                      color: AppTheme.redPrimaryColor,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  ],
                ):SizedBox(),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                appBarText("TV Shows", () { }),
                appBarText("Movies", () { }),
                appBarText("My List", () { }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
