import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
class ComingSoonMoviesRepository{
  Future<List<dynamic>>getComingSoonMovies()async{
    try {
      const url = Strings.getComingSoonMovies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print("error here");
      print(e.toString());
      return[];
    }
  }
}