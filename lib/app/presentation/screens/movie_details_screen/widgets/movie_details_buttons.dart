
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/video.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class MovieDetailsButtons extends StatefulWidget {
  const MovieDetailsButtons({Key? key,required this.movie}) : super(key: key);
  final MovieModel movie;

  @override
  State<MovieDetailsButtons> createState() => _MovieDetailsButtonsState();
}

class _MovieDetailsButtonsState extends State<MovieDetailsButtons> {

  int progress = 0;


  ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    ///Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    ///ssending the data
    sendPort?.send([id, status, progress]);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///register a send port for the other isolates
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");


    ///Listening for the data is comming other isolataes
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });

      print(progress);
    });


    FlutterDownloader.registerCallback(downloadingCallback);
  }



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
            Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MovieVideoPlayer(trailerPath: widget.movie.trailer!,)));
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
          function: ()async {
            final status = await Permission.storage.request();

            if (status.isGranted) {
              final externalDir = await getExternalStorageDirectory();
              print(externalDir);
              final id = await FlutterDownloader.enqueue(
                url:widget.movie.trailer!,
                savedDir: externalDir!.path,
                fileName: widget.movie.name!,
                showNotification: true,
                openFileFromNotification: true,
              );


            } else {
              print("Permission deined");
            }
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
        if(progress==0||progress==100)
          Container()
        else
          LinearProgressIndicator(value: progress/100,minHeight: 10,color: Colors.red,),
      ],
    );
  }
}
