import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_box.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MovieModel> allMovies = BlocProvider.of<GetAllMoviesDataCubit>(context).allMoviesData;
    allMovies.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "MORE LIKE THIS",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(5).copyWith(bottom: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
              childAspectRatio: 0.7,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5
          ),
          itemBuilder: (context, i) {
            return MoviesBox(
              imagePath: allMovies[i].image!,
              arguments: allMovies[i].id!,
            );
          },
          itemCount: 9,
        ),
      ],
    );
  }
}
