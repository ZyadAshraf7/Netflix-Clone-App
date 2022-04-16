import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart'as http;
import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
class UserDataRepository{
  Future<Map<String,dynamic>>getUserData()async{
    try {
      const url = Strings.getUserData;
      // send idToken to receive user data
      UserPreferences.setUserToken(await FirebaseAuth.instance.currentUser!.getIdToken());
      final response = await http.post(Uri.parse(url), body: {
        "idToken": UserPreferences.getUserToken()
      });
      /*const url = Strings.refreshToken;
      print("token ${await FirebaseAuth.instance.currentUser?.getIdToken()}");

      final response = await http.post(Uri.parse(url), body: json.encode({
        'grant_type': 'refresh_token',
        'refresh_token': FirebaseAuth.instance.currentUser?.refreshToken, // Your refresh token.
      }),);
      print("userData ${response.body}");*/
      return jsonDecode(response.body);
    }catch(e){
      print(e.toString());
      return{};
    }
  }
}