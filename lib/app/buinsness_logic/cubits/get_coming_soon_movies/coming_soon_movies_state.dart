part of 'coming_soon_movies_cubit.dart';

@immutable
abstract class ComingSoonMoviesState {}

class ComingSoonMoviesInitial extends ComingSoonMoviesState {}

class ComingSoonMoviesLoading extends ComingSoonMoviesState {}

class ComingSoonMoviesLoadedSuccess extends ComingSoonMoviesState {}

class ComingSoonMoviesError extends ComingSoonMoviesState {}
