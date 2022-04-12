part of 'get_all_movies_data_cubit.dart';

@immutable
abstract class GetAllMoviesDataState {}

class GetAllMoviesDataInitial extends GetAllMoviesDataState {}
class GetAllMoviesDataLoading extends GetAllMoviesDataState {}
class GetAllMoviesDataLoadedSuccess extends GetAllMoviesDataState {}
class GetAllMoviesDataError extends GetAllMoviesDataState {}

