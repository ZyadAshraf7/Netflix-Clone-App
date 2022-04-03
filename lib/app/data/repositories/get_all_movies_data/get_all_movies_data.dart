import 'dart:convert';

import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:http/http.dart' as http;
class AllMoviesDataRepository{
  Future<List<dynamic>>getAllMoviesData()async{
    try {
      const url = Strings.getAllDataMovies;
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    }catch(e){
      print("error here");
      print(e.toString());
      return[];
    }
  }
}