import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/home_poster.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/poster_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/previews_avatars.dart';
import 'widgets/movies_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double scrollOffset = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    BlocProvider.of<GetUserDataCubit>(context).getUserData();
    scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          scrollOffset = scrollController.offset;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //const SizedBox(height: 20),
            CustomScrollView(
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      const HomePoster(),
                      //PosterShimmer(),
                      const SizedBox(height: 13),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Previews",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      const PreviewsAvatars(),
                      const SizedBox(height: 16),
                      //MoviesShimmer(),
                      MoviesBox(title: "Popular on Netflix", imagePath: "assets/images/movie.jpg"),
                      const SizedBox(height: 16),
                      MoviesBox(title: "Trending Now", imagePath: "assets/images/movie.jpg"),
                      const SizedBox(height: 16),
                      MoviesBox(title: "Netflix Originals", imagePath: "assets/images/movie.jpg"),
                      const SizedBox(height: 16),
                      MoviesBox(title: "New Release", imagePath: "assets/images/movie.jpg"),
                    ],
                  ),
                )
              ],
            ),
            HomeAppBar(
              scrollOffset: scrollOffset,
            ),
          ],
        ),
      ),
    );
  }
}
