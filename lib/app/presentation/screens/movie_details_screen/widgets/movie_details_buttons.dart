import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
Widget movieDetailsButtons (BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Column(
    children: [
      CustomButton(
        width: size.width-17,
        height: 45,
        color: AppTheme.smokeWhiteColor,
        function: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MovieVideoPlayer()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/icons/play.svg"),
            const SizedBox(width: 13),
            const Text("Play",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      const SizedBox(height: 13),
      CustomButton(
        width: size.width-17,
        height: 45,
        color: AppTheme.smokeWhiteColor.withOpacity(0.2),
        function: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/icons/download.svg",color: Colors.white,width: 30,height: 30,),
            const SizedBox(width: 13),
            const Text("Download",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,),)
          ],
        ),
      ),
    ],
  );
}