part of 'get_movies_cubit.dart';

@immutable
abstract class GetMoviesState {}

class GetMoviesInitial extends GetMoviesState {}

class GetMoviesLoading extends GetMoviesState {}

class GetMoviesLoadedSuccess extends GetMoviesState {}

class GetMoviesError extends GetMoviesState {}
