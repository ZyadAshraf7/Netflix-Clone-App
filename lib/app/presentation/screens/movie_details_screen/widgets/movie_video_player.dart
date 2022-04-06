import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class MovieVideoPlayer extends StatefulWidget {
  const MovieVideoPlayer({Key? key, required this.trailerPath}) : super(key: key);
  final String trailerPath;

  @override
  _MovieVideoPlayerState createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends State<MovieVideoPlayer> {
  late VideoPlayerController controller;
  late ChewieController chewieController;
  String m =
      "https://imdb-video.media-imdb.com/vi745521945/1434659607842-pgv4ql-1646173137923.mp4?Expires=1649356599&Signature=QJxXeozmLTtGCNpRXVMFSxKn2TnXYnl5hN5nFMQSlrcajlY~rAYNzvwnXwBAj5a-tAlyvormqFK8-S89odaJ5x5ETOJvrLSnTwfQiqWvr1Vbw91s6r-GFbRwInX2gsteUF5IZK7-Fr-KiG1tomBlRlDvr5ogKuJApaZx2OjZ8QwD-Nqng0Kxt3Z4RuR~gc0SVadpx180Tr7zc8Oogil4MyDC2Jv1NuO3Nojfj3RWPYrwrVCvjPLDCj6xlRNe-WKJX25OMHGum4QPpfpdRNqMpAgFdhuL5u9Afeeny9RywNPbkfs4Cg-OFDfGX8Y3vlL1pcmscaD7eN4Yd1yTxRm4Ww__&Key-Pair-Id=APKAIFLZBVQZ24NQH3KA";
  bool loading = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.trailerPath)
      ..initialize().then((value) {
        controller.play();
        setState(() {
          loading = false;
        });
      });
    //controller.initialize();
    chewieController = ChewieController(
        videoPlayerController: controller,
        looping: true,
        autoPlay: true,
        allowFullScreen: true,
        //aspectRatio: controller.value.aspectRatio,
        routePageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, provider) {
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
        });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppTheme.redPrimaryColor,
                ),
              )
            : Chewie(
                controller: chewieController,
              ));
  }
}

class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key? key, required this.child}) : super(key: key);

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
