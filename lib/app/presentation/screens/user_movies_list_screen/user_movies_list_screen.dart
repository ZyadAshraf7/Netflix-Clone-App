import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/user_movies_list/user_movies_list_cubit.dart';
import 'package:netflix_app/app/core/constants/route_names.dart';

import '../home_screen/widgets/movies_box.dart';

class UserMoviesScreen extends StatelessWidget {
  const UserMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final c = BlocProvider.of<UserMoviesListCubit>(context).userMoviesList;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'My List',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(5).copyWith(bottom: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.6,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
          ),
          itemBuilder: (context, i) {
            return MoviesBox(
              imagePath: c[i].image!,
              arguments: c[i].id!,
            );
          },
          itemCount: c.length,
        ),
      ),
    );
  }
}
