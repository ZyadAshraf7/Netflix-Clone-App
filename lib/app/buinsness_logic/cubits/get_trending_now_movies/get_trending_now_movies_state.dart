part of 'get_trending_now_movies_cubit.dart';

@immutable
abstract class GetTrendingNowMoviesState {}

class GetTrendingNowMoviesInitial extends GetTrendingNowMoviesState {}

class GetTrendingNowMoviesLoading extends GetTrendingNowMoviesState {}

class GetTrendingNowMoviesLoadedSuccess extends GetTrendingNowMoviesState {}

class GetTrendingNowMoviesError extends GetTrendingNowMoviesState {}
