import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_box.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_shimmer.dart';

class NetflixMovies extends StatelessWidget {
  const NetflixMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final netflixMovies = BlocProvider.of<GetMoviesCubit>(context, listen: false).moviesData;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Netflix Movies",
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
                imagePath: netflixMovies[i].image!,
                arguments: netflixMovies[i].id!,
              );
            },
            separatorBuilder: (context, i) => const SizedBox(
              width: 7,
            ),
            itemCount: netflixMovies.length,
          ),
        ),
      ],
    );
  }
}
