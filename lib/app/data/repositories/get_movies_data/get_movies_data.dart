import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app/app/data/models/movie_model.dart';
class MoviesRepository{
  Future<List<dynamic>>getMovies()async{
    try {
      const url = Strings.getMovies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print("error here");
      print(e.toString());
      return[];
    }
  }
}