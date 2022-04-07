import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/presentation/widgets/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:netflix_app/app/presentation/widgets/container_shimmer.dart';
import 'package:shimmer/shimmer.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: InkWell(
            onTap: () {
              //TODO: press on image to go to movie details
              Navigator.of(context).pushNamed(RouteNames.movieDetailsScreen, arguments: arguments);
              //customBottomSheet(context: context);
            },
            child: Hero(
                tag: arguments,
                transitionOnUserGestures: true,
                child: CachedNetworkImage(
                  maxHeightDiskCache: 200,
                  maxWidthDiskCache: 200,
                  filterQuality: FilterQuality.medium,
                  imageUrl: imagePath,
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
                    imagePath,
                    width: 130,
                    height: 170,
                    fit: BoxFit.cover,
                  ),*/
                ),
          ),
        ),
      ],
    );
  }
}
