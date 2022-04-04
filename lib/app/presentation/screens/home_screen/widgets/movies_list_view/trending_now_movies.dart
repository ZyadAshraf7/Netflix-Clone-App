import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_trending_now_movies/get_trending_now_movies_cubit.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_box.dart';

class TrendingNowMovies extends StatelessWidget {
  const TrendingNowMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendingNowMovies= BlocProvider.of<GetTrendingNowMoviesCubit>(context,listen: false).trendingNowMoviesData;
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Trending Now",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return MoviesBox(
                      imagePath: trendingNowMovies[i].image!,
                      arguments: trendingNowMovies[i].id!,
                    );
                  },
                  separatorBuilder: (context, i) => const SizedBox(
                    width: 7,
                  ),
                  itemCount: trendingNowMovies.length,
                ),
              ),
            ],
          );
  }
}
