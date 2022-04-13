import 'dart:convert';
import 'dart:io';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
class PopularMoviesRepository {
  Future<List<dynamic>>getPopularMovies()async{
    try{
      const url = Strings.getPopularMovies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print(e.toString());
      throw const HttpException("fetch popular movies exception");
    }
  }
}