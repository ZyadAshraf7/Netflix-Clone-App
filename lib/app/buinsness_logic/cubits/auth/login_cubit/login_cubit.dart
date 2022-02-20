import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/repositories/authentication/login_repository.dart';
import 'package:netflix_app/app/data/shared_preference/shared_preference.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
import 'package:netflix_app/app/presentation/widgets/custom_snackbar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.loginRepository}) : super(LoginInitial());

  LoginRepository loginRepository;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  String errorMessage = "";
  bool valid = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordVisibility());
  }

  void loginUser({required String email,required String password}) async {
    emit(LoginLoading());
    try {
      final data = await loginRepository.loginUser(email, password);
      final isVerified = await loginRepository.confirmEmailVerification(email, password);
      if (data['idToken'] != null&&isVerified==true) {
        emit(LoginSuccess());
        print("login success");
        final token = data['idToken'];
        UserPreferences.setUserToken(token);
        UserPreferences.setUserVerification(true);
      }else if (data['idToken'] != null&&isVerified==false){
        emit(UserIsNotVerified());
      }
      else {
        emit(LoginError());
        print("error occurred");
        print(data);
        print("message: ${data['error']['message']}");
        errorMessage = data['error']['message'];
        errorLoginMessage();
      }
    } catch (e) {
      print(e.toString());
      emit(LoginError());
      errorMessage = e.toString();
      errorLoginMessage();
    }
  }

  void init() {
    formKey = GlobalKey<FormState>();
  }

  bool errorLoginMessage(){
    if (errorMessage == "EMAIL_NOT_FOUND") {
      emit(EmailNotFound());
      return false;
    }
    if (errorMessage == "INVALID_PASSWORD") {
    emit(InvalidPassword());
      return false;
    }
    return true;
  }

  bool loginValidation() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      emit(LoginEmptyField());
      return false;
    }
    if (!emailController.text.contains('@')) {
    emit(LoginInvalidEmail());
      return false;
    }
    if(passwordController.text.length<6){
      emit(LoginWeakPassword());
      return false;
    }
    return true;
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
