import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/presentation/widgets/bottom_sheet.dart';

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
                  Navigator.of(context).pushNamed(RouteNames.movieDetailsScreen,arguments: arguments);
                  //customBottomSheet(context: context);
                },
                child: Hero(
                  tag: arguments,
                  transitionOnUserGestures: true,
                  child: Image.network(
                    imagePath,
                    width: 130,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        );
  }
}
