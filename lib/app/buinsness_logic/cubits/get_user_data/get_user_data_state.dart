part of 'get_user_data_cubit.dart';

@immutable
abstract class GetUserDataState {}

class GetUserDataInitial extends GetUserDataState {}
class LoadingUserData extends GetUserDataState {}
class UserDataLoaded extends GetUserDataState {}
class UserDataError extends GetUserDataState {}

