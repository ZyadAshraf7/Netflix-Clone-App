import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/data/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';

class RegisterRepository {
  registerUser(String email, String password) async {
    try {
      const url = Strings.signUpApi;
      final response = await http.post(
        Uri.parse(url),
        body: {
          "email": email,
          "password": password,
        },
      );
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      print(e.toString());
      throw Exception();
    }
  }
  Future<Map<String, dynamic>>sendEmailVerification()async{
    try {
      const url = Strings.sendEmailVerification;
       final userToken = UserPreferences.getUserToken();
      //print("user token is : $userToken");
      final response = await http.post(Uri.parse(url), body: {
        "requestType": "VERIFY_EMAIL",
        "idToken": userToken,
      });
      print("response body => ${response.body}");
      return jsonDecode(response.body) as Map<String, dynamic>;
    }catch(e){
      print("error in send email verification");
      print(e.toString());
      return {};
    }
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
