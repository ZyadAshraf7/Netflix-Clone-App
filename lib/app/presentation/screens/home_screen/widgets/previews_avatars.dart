import 'package:flutter/material.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class PreviewsAvatars extends StatelessWidget {
  const PreviewsAvatars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        separatorBuilder: (context, i) {
          return const SizedBox(width: 7);
        },
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Container(
            width: 100.0,
            height: 100.0,
            decoration: BoxDecoration(
              color: AppTheme.greyColor,
              image: const DecorationImage(
                image: AssetImage("assets/images/movie.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50.0)),
              border: Border.all(
                color: i.isEven ? Colors.red : Colors.amber,
                width: 1.0,
              ),
            ),
          );
        },
        itemCount: 7,
      ),
    );
  }
}
