part of 'home_poster_cubit.dart';

@immutable
abstract class HomePosterState {}

class HomePosterInitial extends HomePosterState {}
class SetHomePosterLoading extends HomePosterState {}
class SetHomePosterLoadedSuccess extends HomePosterState {}
