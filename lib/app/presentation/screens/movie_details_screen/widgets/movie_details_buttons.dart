import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/video.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:path_provider/path_provider.dart';
class MovieDetailsButtons extends StatefulWidget {
  const MovieDetailsButtons({Key? key,required this.trailerPath}) : super(key: key);
  final String trailerPath;

  @override
  State<MovieDetailsButtons> createState() => _MovieDetailsButtonsState();
}

class _MovieDetailsButtonsState extends State<MovieDetailsButtons> {

  bool downloading = false;
  var progressString = "";

  @override
  void initState() {
    super.initState();

   // downloadFile();
  }

 /* Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      var dir = await getApplicationDocumentsDirectory();
      print("path ${dir.path}");
      await dio.download(widget.trailerPath, "${dir.path}/demo.mp4",
          onReceiveProgress: (rec, total) {
            print("Rec: $rec , Total: $total");

            setState(() {
              downloading = true;
              progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
              print(progressString);
            });
          });
    } catch (e) {
      print(e);
    }

    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }*/


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CustomButton(
          width: size.width-17,
          height: 45,
          color: AppTheme.smokeWhiteColor,
          function: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MovieVideoPlayer(trailerPath: widget.trailerPath,)));
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
          function: () {
            
          },
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
}
