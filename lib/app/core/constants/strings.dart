
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/app/buinsness_logic/cubits/get_all_movies_data/get_all_movies_data_cubit.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';

class Strings{
  static const signUpApi ="https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$firebaseApiKey";
  static const signInApi="https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$firebaseApiKey";
  static const sendEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$firebaseApiKey";
  static const confirmEmailVerification = "https://identitytoolkit.googleapis.com/v1/accounts:update?key=$firebaseApiKey";
  static const sendPasswordReset = "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$firebaseApiKey";
  static const getUserData ="https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=$firebaseApiKey";
  static const refreshToken ="https://securetoken.googleapis.com/v1/token?key=$firebaseApiKey";
  static const getMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/netflixMovies/allMovies.json";
  static const getComingSoonMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/comingSoon/comingSoon.json";
  static const getAllDataMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/allDataMovies/allDataMovies.json";
  static const getTrendingNowMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/trendingNow.json";
  static const getPopularMovies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/popularMovies/popularMovies.json";
  static const getTop10Movies = "https://netflix-bfc7b-default-rtdb.firebaseio.com/top10Movies.json";
}
const firebaseApiKey= "AIzaSyBtrUvMWv-L6u49pPM1yjTNi7n--kAOAwA";
const sharedTokenId = "token";
const sharedUserEmail = "email";
const  sharedUserVerification = "userVerification";
/*MovieModel posterMovie = MovieModel(
  name: "The Legend of Tarzan",
  director: "David Yates",
  releaseYear: "2016",
  age: "10+",
  description: "Tarzan, having acclimated to life in London, is called back to his former home in the jungle to investigate the activities at a mining encampment.",
  id: "theLegendOfTarzan",
  runtime: "1h 50 min",
  genres: ["Action", "Adventure", "Drama"],
  starring: ["Alexander Skarsgard","Rory J. Saper","Christian Stevens"],
  trailer: "https://firebasestorage.googleapis.com/v0/b/netflix-bfc7b.appspot.com/o/the%20legend%20of%20trazan.mp4?alt=media&token=9dd4485a-ee73-4b5b-83ab-f47ad8e4fdea",
  image: "https://m.media-amazon.com/images/M/MV5BMzY3OTI0OTcyMF5BMl5BanBnXkFtZTgwNjkxNTAwOTE@._V1_FMjpg_UX1000_.jpg",

);*/
