import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/ger_top_10_movies/get_top10_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_coming_soon_movies/coming_soon_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_popular_movies/get_popular_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_trending_now_movies/get_trending_now_movies_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/home_poster.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/coming_soon_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/netflix_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/popular_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/top10_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_list_view/trending_now_movies.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/poster_shimmer.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/top10_movies_box.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';
import '../../../buinsness_logic/cubits/home_poster/home_poster_cubit.dart';
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
    if (BlocProvider.of<HomePosterCubit>(context).posterMovie == null) {
      BlocProvider.of<HomePosterCubit>(context).setPosterMovie();
    }
    if (BlocProvider.of<GetUserDataCubit>(context).userModel == null) {
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
    if (BlocProvider.of<GetPopularMoviesCubit>(context).popularMoviesData.isEmpty) {
      BlocProvider.of<GetPopularMoviesCubit>(context).fetchPopularMovies();
    }
    if (BlocProvider.of<GetTop10MoviesCubit>(context).top10MoviesData.isEmpty) {
      BlocProvider.of<GetTop10MoviesCubit>(context).fetchTop10Movies();
    }
    if (BlocProvider.of<UserMoviesListCubit>(context).userMoviesList.isEmpty) {
      BlocProvider.of<UserMoviesListCubit>(context).fetchUserMoviesList();

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
                      BlocBuilder<HomePosterCubit, HomePosterState>(
                        builder: (context, state) {
                          if(state is SetHomePosterLoading) {
                            return Center(child: CircularProgressIndicator());
                          }else if (state is SetHomePosterLoadedSuccess) {
                            return HomePoster();
                          }else{
                            return Text("Error");
                          }
                        },
                      ),
                      const SizedBox(height: 13),
                      BlocBuilder<GetTop10MoviesCubit, GetTop10MoviesState>(builder: (context, state) {
                        if (state is GetTop10MoviesLoading) {
                          return const MoviesShimmer();
                        } else if (state is GetTop10MoviesLoadedSuccess) {
                          return const Top10MoviesBox();
                        } else {
                          return const Text("Error");
                        }
                      }),
                      const SizedBox(height: 19),
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
                          } else if (state is ComingSoonMoviesLoadedSuccess) {
                            return const ComingSoonMovies();
                          } else {
                            return const Text("Error");
                          }
                        },
                      ),
                      const SizedBox(height: 19),
                      BlocBuilder<GetTrendingNowMoviesCubit, GetTrendingNowMoviesState>(
                        builder: (context, state) {
                          if (state is GetTrendingNowMoviesLoading) {
                            return const MoviesShimmer();
                          } else if (state is GetTrendingNowMoviesLoadedSuccess) {
                            return const TrendingNowMovies();
                          } else {
                            return Text("Error");
                          }
                        },
                      ),
                      const SizedBox(height: 19),
                      BlocBuilder<GetPopularMoviesCubit, GetPopularMoviesState>(
                        builder: (context, state) {
                          if (state is GetPopularMoviesLoading) {
                            return const MoviesShimmer();
                          } else if (state is GetPopularMoviesLoadedSuccess) {
                            return const PopularMovies();
                          } else {
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
