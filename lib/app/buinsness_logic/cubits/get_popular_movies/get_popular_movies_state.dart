part of 'get_popular_movies_cubit.dart';

@immutable
abstract class GetPopularMoviesState {}

class GetPopularMoviesInitial extends GetPopularMoviesState {}

class GetPopularMoviesLoading extends GetPopularMoviesState {}

class GetPopularMoviesLoadedSuccess extends GetPopularMoviesState {}

class GetPopularMoviesError extends GetPopularMoviesState {}
