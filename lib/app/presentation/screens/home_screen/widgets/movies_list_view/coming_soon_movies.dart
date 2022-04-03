import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_coming_soon_movies/coming_soon_movies_cubit.dart';

import '../movies_box.dart';

class ComingSoonMovies extends StatelessWidget {
  const ComingSoonMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final comingSoonMovies=BlocProvider.of<ComingSoonMoviesCubit>(context,listen: false).comingSoonMoviesData;
    return BlocBuilder<ComingSoonMoviesCubit, ComingSoonMoviesState>(
      builder: (context, state) {
        if(state is ComingSoonMoviesLoading){
          return CircularProgressIndicator();
        }else if(state is ComingSoonMoviesLoadedSuccess){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Coming Soon",
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
                      imagePath: comingSoonMovies[i].image!,
                      arguments: comingSoonMovies[i].id!,
                    );
                  },
                  separatorBuilder: (context, i) => const SizedBox(
                    width: 7,
                  ),
                  itemCount: comingSoonMovies.length,
                ),
              ),
            ],
          );
        }else{
          return Text("error");
        }
      },
    );
  }
}
