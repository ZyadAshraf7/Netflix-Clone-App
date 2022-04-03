import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_box.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_details_buttons.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_text_details.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';

import 'widgets/movie_info_box.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final movie = BlocProvider.of<GetAllMoviesDataCubit>(context).findMovieById(id);
    print(movie.name);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 500,
                width: size.width,
                child: Image.network(
                  movie.image!,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(RouteNames.bottomNavBarScreen);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: SizedBox(
                      height: 300,
                      width: 200,
                      child: Image.network(
                        movie.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MovieInfoBox(age: movie.age!,releaseYear: movie.releaseYear!,movieDuration: movie.runtime!,),
                  const SizedBox(height: 12),
                  movieDetailsButtons(context),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          MovieTextDetails(description: movie.description!,director: movie.director!,starring: movie.starring!),
          const SizedBox(height: 22),
           //const MoviesBox(title: "Related Movies")
        ],
      ),
    );
  }
}
