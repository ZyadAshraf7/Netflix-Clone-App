import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_popular_Movies/get_popular_Movies_repository.dart';

part 'get_popular_movies_state.dart';

class GetPopularMoviesCubit extends Cubit<GetPopularMoviesState> {
  GetPopularMoviesCubit({required this.popularMoviesRepository}) : super(GetPopularMoviesInitial());

  PopularMoviesRepository popularMoviesRepository;
  List<MovieModel>popularMoviesData=[];
  void fetchPopularMovies()async{
    try{
      emit(GetPopularMoviesLoading());
      final data = await popularMoviesRepository.getPopularMovies();
      if(data.isEmpty){
        emit(GetPopularMoviesError());
      }else{
        popularMoviesData=data.map((movie) => MovieModel.fromJson(movie)).toList();
        emit(GetPopularMoviesLoadedSuccess());
      }

    }catch(e){
      print(e.toString());
      emit(GetPopularMoviesError());
    }
  }
}
