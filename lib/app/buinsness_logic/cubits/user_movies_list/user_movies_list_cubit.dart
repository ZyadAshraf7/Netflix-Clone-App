import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';

part 'user_movies_list_state.dart';

class UserMoviesListCubit extends Cubit<UserMoviesListState> {
  UserMoviesListCubit() : super(UserMoviesListInitial());
  List<MovieModel>userMoviesList = [];

  addMovieToList(MovieModel movie) {
    userMoviesList.insert(0,movie);
    emit(UserMovieStateChanged());
    CollectionReference collectionRef = FirebaseFirestore.instance.collection("Movies List");
    return collectionRef.doc(FirebaseAuth.instance.currentUser?.email).collection("movies").doc(movie.id).set(
      movie.toJson(),
    );
  }
  removeMovieFromList(MovieModel movie) {
    userMoviesList.removeWhere((element) => element.id == movie.id);
    emit(UserMovieStateChanged());
    CollectionReference collectionRef = FirebaseFirestore.instance.collection("Movies List");
    return collectionRef.doc(FirebaseAuth.instance.currentUser?.email).collection("movies").doc(movie.id).delete();
  }
  fetchUserMoviesList() async {
    CollectionReference collectionRef = FirebaseFirestore.instance.collection("Movies List");
    var snapshot = await collectionRef.doc(FirebaseAuth.instance.currentUser?.email).collection("movies").get();
    for (var doc in snapshot.docs) {
      final extractedData = doc.data();
      final movie = MovieModel.fromJson(extractedData);
      if(!checkIfMovieExist(movie)){
        userMoviesList.add(movie);
      }
    }
  }
  bool checkIfMovieExist(MovieModel movie){
    if(userMoviesList.any((element) => element.id==movie.id)){
      return true;
    }else{
      return false;
    }
  }
}
