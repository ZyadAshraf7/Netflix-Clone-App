import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/repositories/authentication/forget_password_repository.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.forgetPasswordRepository}) : super(ForgetPasswordInitial());
  ForgetPasswordRepository forgetPasswordRepository;
  TextEditingController emailController = TextEditingController();
  bool valid = true;
  FocusNode focusNode = FocusNode();

  sendPasswordReset(String email)async{
    emit(SendEmailResetLoading());
    try {
      final data = await forgetPasswordRepository.sendPasswordReset(email);
      if(data['email']!=null){
        emit(SendEmailResetSuccess());
      }
      if(data['error']['message']=="EMAIL_NOT_FOUND"){
        emit(EmailNotExist());
      }
      else{
        emit(SendEmailResetError());
      }
      print("data: $data");
    } catch(e){
      print("error: $e");
      print(e.toString());
      emit(SendEmailResetError());
    }
  }
  bool emailValidation(String email){
    if(email.isEmpty){
      valid = false;
      emit(EmptyFieldRequired());
      return valid;
    }
    if(!email.contains('@')){
      valid = false;
      emit(InvalidEmail());
      return valid;
    }else{
      return true;
    }
  }
  @override
  Future<void>close(){
    focusNode.dispose();
    emailController.dispose();
    return super.close();
  }
}
