import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
class TrendingNowMoviesRepository{
  Future<List<dynamic>>getTrendingNowMovies()async{
    try {
      const url = Strings.getTrendingNowMovies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print("error here");
      print(e.toString());
      return[];
    }
  }
}