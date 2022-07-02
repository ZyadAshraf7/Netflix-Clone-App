import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_top_10_movies/get_top_10_movies.dart';

part 'get_top10_movies_state.dart';

class GetTop10MoviesCubit extends Cubit<GetTop10MoviesState> {
  GetTop10MoviesCubit({required this.top10MoviesRepository}) : super(GetTop10MoviesInitial());
  Top10MoviesRepository top10MoviesRepository;
  late List<MovieModel>top10MoviesData=[];

  Future<void>fetchTop10Movies()async {
    try{
      emit(GetTop10MoviesLoading());
      final data = await top10MoviesRepository.getTop10Movies();
      if (data.isNotEmpty) {
        emit(GetTop10MoviesLoadedSuccess());
        top10MoviesData = (data).map((e) => MovieModel.fromJson(e)).toList();
      }else{
        emit(GetTop10MoviesError());
      }
    }catch(e){
      emit(GetTop10MoviesError());
      print(e.toString());
    }
  }
}
