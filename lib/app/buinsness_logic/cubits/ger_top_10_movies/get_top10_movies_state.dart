part of 'get_top10_movies_cubit.dart';

@immutable
abstract class GetTop10MoviesState {}

class GetTop10MoviesInitial extends GetTop10MoviesState {}
class GetTop10MoviesLoading extends GetTop10MoviesState {}
class GetTop10MoviesLoadedSuccess extends GetTop10MoviesState {}
class GetTop10MoviesError extends GetTop10MoviesState {}
