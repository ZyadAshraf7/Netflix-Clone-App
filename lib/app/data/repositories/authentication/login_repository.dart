import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:netflix_app/app/core/constants/strings.dart';
class LoginRepository {
  loginUser(String email,String password)async{
    const url = Strings.signInApi;
    final response = await http.post(Uri.parse(url),body: {
      "email":email,
      "password":password,
    });
    return jsonDecode(response.body);
  }
  Future<bool>confirmEmailVerification(String email,String password)async{
    try{
      final FirebaseAuth _auth = FirebaseAuth.instance;
      var authenticatedUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final verifiedUser=authenticatedUser.user!.emailVerified;
      if(verifiedUser){
        return true;
      }else{
        return false;
      }
    }catch(e){
      print("error in confirm email verification");
      print(e.toString());
      return false;
    }
  }
}