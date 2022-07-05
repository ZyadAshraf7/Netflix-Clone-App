import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_popular_movies/get_popular_movies_cubit.dart';

import '../movies_box.dart';


class PopularMovies extends StatelessWidget {
  const PopularMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final popularMovies = BlocProvider.of<GetPopularMoviesCubit>(context, listen: false).popularMoviesData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Popular Movies",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return MoviesBox(
                imagePath: popularMovies[i].image!,
                arguments: popularMovies[i].id!,
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              width: 7,
            ),
            itemCount: popularMovies.length,
          ),
        ),
      ],
    );
  }
}
