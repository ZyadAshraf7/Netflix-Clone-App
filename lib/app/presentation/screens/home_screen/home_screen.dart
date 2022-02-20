import 'package:flutter/material.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/home_poster_and_app_bar.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/previews_avatars.dart';
import 'widgets/movies_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(bottom: 4),
        children: [
          const HomePosterAndAppBar(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Previews",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                const PreviewsAvatars(),
                const SizedBox(height: 16),
                MoviesBox(title: "Popular on Netflix", imagePath: "assets/images/movie.jpg"),
                const SizedBox(height: 13),
                MoviesBox(title: "Trending Now", imagePath: "assets/images/movie.jpg"),
                const SizedBox(height: 13),
                MoviesBox(title: "Netflix Originals", imagePath: "assets/images/movie.jpg"),
                const SizedBox(height: 13),
                MoviesBox(title: "New Release", imagePath: "assets/images/movie.jpg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

