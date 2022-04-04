import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class MovieVideoPlayer extends StatefulWidget {
  const MovieVideoPlayer({Key? key}) : super(key: key);

  @override
  _MovieVideoPlayerState createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends State<MovieVideoPlayer> {
  late VideoPlayerController controller;
  late ChewieController chewieController;
  String m = "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(m);
    chewieController = ChewieController(videoPlayerController: controller,
      looping: true,
      autoPlay: true,
      allowFullScreen: true,
        routePageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return VideoScaffold(
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: provider,
                  ),
                ),
              );
            },
          );
        }
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Chewie(controller: chewieController));
  }
}




class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key? key,required this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _VideoScaffoldState();
}

class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    AutoOrientation.landscapeAutoMode();
    super.initState();
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    AutoOrientation.portraitAutoMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}