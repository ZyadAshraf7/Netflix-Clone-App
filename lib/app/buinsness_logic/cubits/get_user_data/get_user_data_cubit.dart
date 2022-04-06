import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/user.dart';
import 'package:netflix_app/app/data/repositories/get_user_data/user_data_repository.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit({required this.userDataRepository}) : super(GetUserDataInitial());
  UserDataRepository userDataRepository;
   UserModel? userModel;

   getUserData() async {
    try {
      emit(LoadingUserData());
      final data = await userDataRepository.getUserData();
      print(data);
    //  print(data['users'][0]);
      if(data['users']!=null) {
        final userData = await data['users'][0];
        //print("user data : $userData");
        userModel = UserModel(
          email: userData['email'],
          userName: userData['displayName']??"",
          photoUrl: userData['photoUrl']??"",
        );
        //print("user email: ${userModel!.email}");
        emit(UserDataLoaded());
      }else{
        emit(UserDataError());
        throw Exception();
      }
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
}
