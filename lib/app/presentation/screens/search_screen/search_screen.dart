import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_user_data/get_user_data_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';
import 'package:netflix_app/app/core/theme/app_theme.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_user_data/user_data_repository.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/app_bar.dart';
import 'package:netflix_app/app/presentation/screens/movie_details_screen/widgets/movie_video_player.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchedText = TextEditingController();
  FocusNode focusNode = FocusNode();
  late List<MovieModel> allMovies;
  late List<MovieModel> searchedMovies;

  void addSearchedFOrItemsToSearchedList(String searchedCharacter) {
    searchedMovies = allMovies.where((character) => character.name!.toLowerCase().startsWith(searchedCharacter)).toList();
    setState(() {});
  }

  @override
  void initState() {
    allMovies = BlocProvider.of<GetAllMoviesDataCubit>(context).allMoviesData;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchedText.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchedText.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
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
                  const UserProfileBox(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              width: size.width,
              color: AppTheme.deepDarkGrey,
              child: TextFormField(
                onChanged: (c) {
                  addSearchedFOrItemsToSearchedList(c);
                },
                focusNode: focusNode,
                controller: searchedText,
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
                  suffixIcon: IconButton(
                      onPressed: () {
                        searchedText.clear();
                      },
                      icon: searchedText.text.isNotEmpty
                          ? const Icon(
                              Icons.clear,
                              size: 20,
                              color: Colors.white,
                            )
                          : const SizedBox()),
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
            BlocBuilder<GetAllMoviesDataCubit, GetAllMoviesDataState>(
              builder: (context, state) {
                if (state is GetAllMoviesDataLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.redPrimaryColor,
                    ),
                  );
                }
                if (state is GetAllMoviesDataLoadedSuccess) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                RouteNames.movieDetailsScreen,
                                arguments: searchedText.text.isEmpty ? allMovies[i].id! : searchedMovies[i].id!,
                              );
                              focusNode.unfocus();
                            },
                            child: Container(
                              width: size.width,
                              color: AppTheme.deepDarkGrey,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    height: 90,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: CachedNetworkImage(
                                        maxHeightDiskCache: 500,
                                        maxWidthDiskCache: 500,
                                        filterQuality: FilterQuality.high,
                                        imageUrl: searchedText.text.isEmpty ? allMovies[i].image! : searchedMovies[i].image!,
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
                                          Expanded(
                                            child: Text(
                                              searchedText.text.isEmpty ? allMovies[i].name! : searchedMovies[i].name!,
                                              style: const TextStyle(color: Colors.white, overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              focusNode.unfocus();
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) => MovieVideoPlayer(
                                                    trailerPath: searchedText.text.isEmpty ? allMovies[i].trailer! : searchedMovies[i].trailer!,
                                                  ),
                                                ),
                                              );
                                            },
                                            icon: SvgPicture.asset("assets/images/icons/play-circle.svg"),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, _) {
                          return const SizedBox(height: 4);
                        },
                        itemCount: searchedText.text.isEmpty ? allMovies.length : searchedMovies.length),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}



