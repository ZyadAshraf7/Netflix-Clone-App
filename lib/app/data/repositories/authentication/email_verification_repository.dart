import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/app/data/shared_preference/user_preference.dart';
class EmailVerificationRepository {

  Future<Map<String, dynamic>>sendEmailVerification({required String userToken})async{
    try {
      const url = Strings.sendEmailVerification;
     /* final userToken = UserPreferences.getUserToken();
      print("user token is : $userToken");*/
      final response = await http.post(Uri.parse(url), body: {
        "requestType": "VERIFY_EMAIL",
        "idToken": userToken,
      });
      return jsonDecode(response.body) as Map<String, dynamic>;
    }catch(e){
      print("error in send email verification");
      print(e.toString());
      return {};
    }
  }

  Future<Map<String, dynamic>>confirmEmailVerification(String oobCode)async{
    try{
      const url = Strings.sendEmailVerification;
      final response = await http.post(Uri.parse(url), body: {"oobCode": oobCode});
      print(response.body);
      return jsonDecode(response.body) as Map<String, dynamic>;
    }catch(e){
      print("error in confirm email verification");
      print(e.toString());
      return {};
    }
  }
}