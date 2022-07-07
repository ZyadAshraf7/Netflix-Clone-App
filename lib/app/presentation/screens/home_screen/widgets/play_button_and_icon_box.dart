import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/home_poster/home_poster_cubit.dart';
import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/presentation/widgets/bottom_sheet.dart';

import '../../../../buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import '../../../../buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';
import '../../../../core/constants/route_names.dart';
import '../../movie_details_screen/widgets/movie_video_player.dart';
import 'icon_box.dart';
import 'play_button.dart';

class PosterIconsBox extends StatelessWidget {
  const PosterIconsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final posterMovie = BlocProvider.of<HomePosterCubit>(context).posterMovie;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<UserMoviesListCubit, UserMoviesListState>(
            builder: (context, state) {
              final userMoviesListCubit = BlocProvider.of<UserMoviesListCubit>(context);
              return iconBox(
                title: "My List",
                iconPath: userMoviesListCubit.checkIfMovieExist(posterMovie!) ? "assets/images/icons/addedToList.svg" : "assets/images/icons/plus.svg",
                onTap: () {
                  if (!userMoviesListCubit.checkIfMovieExist(posterMovie)) {
                    userMoviesListCubit.addMovieToList(posterMovie);
                  } else {
                    userMoviesListCubit.removeMovieFromList(posterMovie);
                  }
                },
              );
            },
          ),
          const PlayButton(),
          iconBox(
            title: "Info",
            iconPath: "assets/images/icons/info.svg",
            onTap: () {
              // customBottomSheet(context: context);
              customBottomSheet(
                context: context,
                movie: posterMovie!,
                navigateFunction: () => Navigator.of(context).pushNamed(
                  RouteNames.movieDetailsScreen,
                  arguments: posterMovie.id,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
