import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/repositories/get_user_data/user_data_repository.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: size.width,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/images/icons/netflix-n.svg",
                    width: 20,
                    height: 40,
                    color: AppTheme.redPrimaryColor,
                  ),
                  UserProfileBox(profileCubit: BlocProvider.of<GetUserDataCubit>(context)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: size.width,
              color: AppTheme.deepDarkGrey,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      "assets/images/icons/Search.svg",
                      color: AppTheme.midGreyColor,
                      height: 20,
                      width: 20,
                    ),
                  ),
                  hintText: "Search for a show, movie, genre, e.t.c.",
                  hintStyle: const TextStyle(
                    color: AppTheme.midGreyColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 21),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                "Top Searches",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 21),
            TopSearchedMoviesBox(),
          ],
        ),
      ),
    ));
  }
}

class TopSearchedMoviesBox extends StatelessWidget {
  const TopSearchedMoviesBox({Key? key}) : super(key: key);

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
