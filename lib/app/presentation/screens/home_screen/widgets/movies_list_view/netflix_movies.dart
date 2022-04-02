import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_movies_data/get_movies_cubit.dart';
import 'package:netflix_app/app/presentation/screens/home_screen/widgets/movies_box.dart';

class NetflixMovies extends StatefulWidget {
  const NetflixMovies({Key? key}) : super(key: key);

  @override
  State<NetflixMovies> createState() => _NetflixMoviesState();
}

class _NetflixMoviesState extends State<NetflixMovies> {
  @override
  void initState() {
    if(BlocProvider.of<GetMoviesCubit>(context).moviesData.isEmpty) {
      BlocProvider.of<GetMoviesCubit>(context).fetchMovies();
    }
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    final netflixMovies = BlocProvider.of<GetMoviesCubit>(context,listen: false).moviesData;

    return BlocConsumer<GetMoviesCubit,GetMoviesState>(
      builder: (context, state) {
        if(state is GetMoviesLoading){
          return CircularProgressIndicator();
        }
        if(state is GetMoviesLoadedSuccess){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Netflix Movies",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return MoviesBox(moviesCategory: "Netflix Movies", imagePath: netflixMovies[i].image!);
                  },
                  separatorBuilder: (context, i) =>
                  const SizedBox(
                    width: 7,
                  ),
                  itemCount: netflixMovies.length,
                ),
              ),
            ],
          );
        }else{
          print("error");
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }
}
