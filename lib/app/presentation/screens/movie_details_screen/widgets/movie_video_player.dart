import 'package:auto_orientation/auto_orientation.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:video_player/video_player.dart';

class MovieVideoPlayer extends StatefulWidget {
  MovieVideoPlayer({Key? key, required this.trailerPath,this.autoPlay,this.allowFullScreen,this.showOptions,this.isComingSoon}) : super(key: key);
  final String trailerPath;
  bool ?autoPlay;
  bool ? allowFullScreen;
  bool ? showOptions;
  bool ? isComingSoon;

  @override
  _MovieVideoPlayerState createState() => _MovieVideoPlayerState();
}

class _MovieVideoPlayerState extends State<MovieVideoPlayer> {
  late ChewieController chewieController;
  late VideoPlayerController controller;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.trailerPath)
      ..initialize().then((value) {
        if(widget.isComingSoon??false) {
          controller.pause();
        }else{
          controller.play();
        }
        setState(() {
          loading = false;
        });
      });
    //controller.initialize();
    chewieController = ChewieController(
        videoPlayerController: controller,
        autoPlay: widget.autoPlay??true,
        allowFullScreen: widget.allowFullScreen??true,
        //showControls: widget.showControls??true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
        showOptions: widget.showOptions??true,
        materialProgressColors: ChewieProgressColors(
          playedColor: AppTheme.redPrimaryColor,
          handleColor: Colors.white,
          bufferedColor: Colors.white54,
        ),
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        },
        /*routePageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget? child) {
              return VideoScaffold(
                child: Scaffold(
                  //resizeToAvoidBottomInset: false,
                  body: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: provider,
                  ),
                ),
              );
            },
          );
        }*/);

    chewieController.addListener(() {
      if (chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    chewieController.pause();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    //chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: true,
      body: loading
          ? const Center(
              child: CircularProgressIndicator(
                color: AppTheme.redPrimaryColor,
              ),
            )
          : Chewie(
              controller: chewieController,
            ),
    );
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
    //AutoOrientation.portraitAutoMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
