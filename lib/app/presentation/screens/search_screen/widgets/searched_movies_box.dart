import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';

class SearchedMoviesBox extends StatelessWidget {
  const SearchedMoviesBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, i) {
            return Container(
              width: size.width,
              color: AppTheme.deepDarkGrey,
              child: Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: Image.asset(
                        "assets/images/poster.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: SizedBox(
                      width: size.width - 175,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Dark Desires",
                            style: TextStyle(color: Colors.white),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/images/icons/play-circle.svg"),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, _) {
            return const SizedBox(height: 4);
          },
          itemCount: 20),
    );
  }
}