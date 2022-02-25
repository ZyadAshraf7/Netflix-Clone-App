import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix_app/app/core/constants/strings.dart';

class ForgetPasswordRepository {

  Future <Map<String,dynamic>>sendPasswordReset(String email) async {
    try {
      const url = Strings.sendPasswordReset;
      final response = await http.post(Uri.parse(url), body: {
        "email": email,
        "requestType":"PASSWORD_RESET"
      });
      return jsonDecode(response.body);
    }catch(e){
      print(e.toString());
      return {};
    }
  }
}
