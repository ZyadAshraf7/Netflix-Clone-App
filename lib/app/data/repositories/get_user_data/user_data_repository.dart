import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
class UserDataRepository{
  Future<Map<String,dynamic>>getUserData()async{
    try {
      const url = Strings.getUserData;
      // send idToken to receive user data
      final response = await http.post(Uri.parse(url), body: {
        "idToken": UserPreferences.getUserToken()
      });
      //print("userData ${response.body}");
      return jsonDecode(response.body);
    }catch(e){
      print(e.toString());
      return{};
    }
  }
}