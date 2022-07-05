import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_coming_soon_movies/coming_soon_movies_cubit.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ComingSoonScreen extends StatefulWidget {
  ComingSoonScreen({Key? key}) : super(key: key);

  @override
  State<ComingSoonScreen> createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  bool isVisible=false;
  late ScrollController _scrollController;
  double scrollOffset = 0;

  @override
  void initState() {
    _scrollController=ScrollController()..addListener(() {
      setState(() {
        scrollOffset=_scrollController.offset;
        //print("scroll offset: $scrollOffset");
        if((scrollOffset>0&&scrollOffset<230)||(scrollOffset>230&&scrollOffset<460)){
          isVisible=true;
        }
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final movies = BlocProvider.of<ComingSoonMoviesCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(

          children: [
             Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "New & Hot",
                      style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    UserProfileBox()
                  ],
                ),
              ),
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Row(
                              children: [
                                SizedBox(height: 20, width: 20, child: SvgPicture.asset("assets/images/icons/popcorn.svg")),
                                const SizedBox(width: 10),
                                const Text(
                                  "Coming Soon",
                                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            color: Colors.transparent,
                            child: ListView.separated(
                              separatorBuilder: (context, _) {
                                return const SizedBox(height: 18);
                              },
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: movies.comingSoonMoviesData.length,
                              itemBuilder: (context, i) {
                                return Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movies.comingSoonMoviesData[i].releaseDate!.substring(0, 3),
                                            style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            movies.comingSoonMoviesData[i].releaseDate!.substring(3, 6).toUpperCase(),
                                            style: TextStyle(
                                              color: Colors.grey[300],
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //const SizedBox(width: 10),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: size.width * 0.82,
                                          height: 200,
                                          child: MovieVideoPlayer(
                                            isComingSoon: true,
                                            autoPlay: false,
                                            showOptions: false,
                                            allowFullScreen: false,
                                            trailerPath: movies.comingSoonMoviesData[i].trailer!,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          movies.comingSoonMoviesData[i].name!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 9),
                                        SizedBox(
                                          width: size.width * 0.75,
                                          child: Text(
                                            movies.comingSoonMoviesData[i].description!,
                                            style: TextStyle(
                                              color: Colors.grey[400],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        Text(
                                          movies.comingSoonMoviesData[i].genres!.join(" . "),
                                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
