import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';

class MoviesBox extends StatelessWidget {
  const MoviesBox({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 190,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) => ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: GestureDetector(
                onTap: (){
                  //TODO: press on image to go to movie details
                  Navigator.of(context).pushNamed(RouteNames.movieDetailsScreen);
                },
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            separatorBuilder: (context, i) => const SizedBox(
              width: 7,
            ),
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
