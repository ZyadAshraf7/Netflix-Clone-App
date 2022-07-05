import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/icon_box.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';
import 'package:netflix_app/app/presentation/widgets/custom_button.dart';
import 'package:shimmer/shimmer.dart';

import '../../buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';

Future customBottomSheet({required BuildContext context, required MovieModel movie, required VoidCallback navigateFunction}) {

  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
    context: context,
    builder: (_) => GestureDetector(
      onTap: navigateFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: CachedNetworkImage(
                      maxHeightDiskCache: 500,
                      maxWidthDiskCache: 500,
                      filterQuality: FilterQuality.high,
                      imageUrl: movie.image!,
                      width: 130,
                      height: 170,
                      fit: BoxFit.cover,
                      placeholder: (context, _) {
                        return SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(50.0),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[100]!,
                              highlightColor: Colors.grey[200]!,
                              child: SvgPicture.asset(
                                "assets/images/icons/netflix-n.svg",
                                //color: AppTheme.redPrimaryColor.withOpacity(0.6),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                    /*Image.network(
                    movie.image!,
                    height: 120,
                  ),*/
                    ),
                const SizedBox(width: 6),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 155,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              movie.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          IconButton(
                            constraints: const BoxConstraints(maxHeight: 26),
                            //alignment: Alignment.topCenter,
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          movie.releaseYear!,
                          style: const TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          movie.age!,
                          style: const TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          movie.runtime!,
                          style: const TextStyle(fontSize: 12, color: Colors.white60),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 128,
                      width: MediaQuery.of(context).size.width - 155,
                      child: Text(
                        movie.description!,
                        style: const TextStyle(color: Colors.white, fontSize: 14, overflow: TextOverflow.ellipsis),
                        maxLines: 6,
                      ),
                    ),
                  ],
                )
              ],
            ),
            //const SizedBox(height: 10),
            Row(
              children: [
                CustomButton(
                  borderRadius: 3,
                  width: 180,
                  height: 30,
                  color: Colors.white,
                  function: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MovieVideoPlayer(
                          trailerPath: movie.trailer!,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/icons/play.svg",
                        width: 16,
                        height: 16,
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Play",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                iconBox(title: "Download", iconPath: "assets/images/icons/download.svg", onTap: () {}),
                const SizedBox(width: 42),
                BlocBuilder<UserMoviesListCubit, UserMoviesListState>(
                  builder: (context, state) {
                    final userMoviesListCubit = BlocProvider.of<UserMoviesListCubit>(context);
                    return iconBox(
                    title: "My List",
                    iconPath:
                        userMoviesListCubit.checkIfMovieExist(movie) ?"assets/images/icons/addedToList.svg": "assets/images/icons/plus.svg",
                    onTap: () {
                      if(!userMoviesListCubit.checkIfMovieExist(movie)) {
                        userMoviesListCubit.addMovieToList(movie);
                      }else{
                        userMoviesListCubit.removeMovieFromList(movie);
                      }
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Colors.white70,
              height: 2,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: navigateFunction,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/info.svg",
                          color: Colors.white,
                          width: 20,
                          height: 22,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Details & More",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
