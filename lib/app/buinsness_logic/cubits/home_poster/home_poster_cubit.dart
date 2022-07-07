import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';


part 'home_poster_state.dart';

class HomePosterCubit extends Cubit<HomePosterState> {
  HomePosterCubit() : super(HomePosterInitial());
  MovieModel ?posterMovie;
   setPosterMovie() async {
    try {
      print("loading");
      emit(SetHomePosterLoading());
      print("loading");
      FirebaseFirestore.instance.collection("posterMovies").get().then((value) {
        if (value.docs.isNotEmpty) {
          posterMovie=value.docs.map((e) => MovieModel.fromJson(e.data())).toList()[0];
          print(jsonEncode(posterMovie));
        }
      }).then((value) {
        emit(SetHomePosterLoadedSuccess());
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
