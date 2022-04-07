import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_coming_soon_movies/coming_soon_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_trending_now_movies/get_trending_now_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/home_poster.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/coming_soon_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/netflix_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/trending_now_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/poster_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/previews_avatars.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';
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
    if(BlocProvider.of<GetUserDataCubit>(context).userModel==null){
      BlocProvider.of<GetUserDataCubit>(context).getUserData();
    }
    if (BlocProvider.of<GetMoviesCubit>(context).moviesData.isEmpty) {
      BlocProvider.of<GetMoviesCubit>(context).fetchMovies();
    }
    if (BlocProvider.of<ComingSoonMoviesCubit>(context).comingSoonMoviesData.isEmpty) {
      BlocProvider.of<ComingSoonMoviesCubit>(context).fetchComingSoonMovies();
    }
    if (BlocProvider.of<GetAllMoviesDataCubit>(context).allMoviesData.isEmpty) {
      BlocProvider.of<GetAllMoviesDataCubit>(context).fetchAllMoviesData();
    }
    if (BlocProvider.of<GetTrendingNowMoviesCubit>(context).trendingNowMoviesData.isEmpty) {
      BlocProvider.of<GetTrendingNowMoviesCubit>(context).fetchTrendingNowMovies();
    }
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
                    children: [
                      const HomePoster(),
                      //PosterShimmer(),
                      const SizedBox(height: 13),

                      const Padding(
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
                      const SizedBox(height: 19),
                      //MoviesShimmer(),
                      //NetflixMovies(),
                      BlocBuilder<GetMoviesCubit, GetMoviesState>(
                        builder: (context, state) {
                          if (state is GetMoviesLoading) {
                            return const MoviesShimmer();
                          } else {
                            return const NetflixMovies();
                          }
                        },
                      ),
                      const SizedBox(height: 19),
                      BlocBuilder<ComingSoonMoviesCubit, ComingSoonMoviesState>(
                        builder: (context, state) {
                          if (state is ComingSoonMoviesLoading) {
                            return const MoviesShimmer();
                          } else if(state is ComingSoonMoviesLoadedSuccess) {
                            return const ComingSoonMovies();
                          }else{
                            return Text("Error");
                          }
                        },
                      ),
                      const SizedBox(height: 19),
                      BlocBuilder<GetTrendingNowMoviesCubit, GetTrendingNowMoviesState>(
                        builder: (context, state) {
                          if (state is GetTrendingNowMoviesLoading) {
                            return const MoviesShimmer();
                          } else if(state is GetTrendingNowMoviesLoadedSuccess) {
                            return const TrendingNowMovies();
                          }else{
                            return Text("Error");
                          }
                        },
                      ),
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
