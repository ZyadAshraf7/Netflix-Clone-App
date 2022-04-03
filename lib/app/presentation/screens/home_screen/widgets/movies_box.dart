import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({
    Key? key,
    required this.imagePath,
    required this.arguments,
  }) : super(key: key);

  final String imagePath;
  final String arguments;

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<GetMoviesCubit, GetMoviesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        //final movies= BlocProvider.of<GetMoviesCubit>(context).moviesData;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: GestureDetector(
                onTap: () {
                  //TODO: press on image to go to movie details
                  Navigator.of(context).pushNamed(RouteNames.movieDetailsScreen,arguments: arguments);
                },
                child: Image.network(
                  imagePath,
                  width: 130,
                  height: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
