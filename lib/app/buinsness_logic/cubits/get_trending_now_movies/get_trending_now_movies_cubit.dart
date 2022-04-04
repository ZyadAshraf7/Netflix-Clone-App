import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_trending_now_movies/get_trending_now_movies.dart';

part 'get_trending_now_movies_state.dart';

class GetTrendingNowMoviesCubit extends Cubit<GetTrendingNowMoviesState> {
  GetTrendingNowMoviesCubit({required this.trendingNowMoviesRepository}) : super(GetTrendingNowMoviesInitial());
  TrendingNowMoviesRepository trendingNowMoviesRepository;
  late List<MovieModel> trendingNowMoviesData=[];

  Future<void>fetchTrendingNowMovies()async{
    try{
      emit(GetTrendingNowMoviesLoading());
      final data = await trendingNowMoviesRepository.getTrendingNowMovies();
      if(data.isNotEmpty){
        trendingNowMoviesData=(data).map((movie) => MovieModel.fromJson(movie)).toList();
        emit(GetTrendingNowMoviesLoadedSuccess());
      }else{
        emit(GetTrendingNowMoviesError());
      }
    }catch(e){
      emit(GetTrendingNowMoviesError());
      print(e.toString());
    }
  }
}
