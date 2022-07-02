import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:http/http.dart'as http;
class Top10MoviesRepository {

  Future<List<dynamic>>getTop10Movies()async{
    try {
      const url = Strings.getTop10Movies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print("error in top 10 movies repo");
      print(e.toString());
      return[];
    }
  }
}