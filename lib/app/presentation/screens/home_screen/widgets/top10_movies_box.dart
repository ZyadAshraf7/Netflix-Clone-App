import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/ger_top_10_movies/get_top10_movies_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';

class Top10MoviesBox extends StatelessWidget {
  const Top10MoviesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final top10Movies = BlocProvider.of<GetTop10MoviesCubit>(context, listen: false).top10MoviesData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Text(
            "Top 10 TV Shows in Egypt Today",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            separatorBuilder: (context, i) {
              return const SizedBox(width: 2);
            },
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  customBottomSheet(
                    context: context,
                    movie: top10Movies[i],
                    navigateFunction: () => Navigator.of(context).pushNamed(RouteNames.movieDetailsScreen, arguments: top10Movies[i].id),
                  );
                },
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                        //height: 190,
                        alignment: Alignment.centerRight,
                        width: 150,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: CachedNetworkImage(
                              maxHeightDiskCache: 500,
                              maxWidthDiskCache: 500,
                              filterQuality: FilterQuality.high,
                              imageUrl: top10Movies[i].image!,
                              width: 130,
                              //height: 170,
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
                          ),
                          width: 130,
                        ),
                    ),
                    Positioned(
                      top: 50,
                      right: i == 9 ? 45 : 65,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Image.asset("assets/images/${i + 1}.png"),
                        height: 190,
                        width: 120,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          i != 0
                              ? BoxShadow(
                                  color: Colors.black.withOpacity(0.7),
                                  offset: const Offset(4, 123),
                                  spreadRadius: 15,
                                  blurRadius: 10,
                                )
                              : const BoxShadow(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: top10Movies.length,
          ),
        ),
      ],
    );
  }
}
