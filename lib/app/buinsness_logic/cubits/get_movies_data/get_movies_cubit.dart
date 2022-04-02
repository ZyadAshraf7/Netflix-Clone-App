import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_movies_data/get_movies_data.dart';

part 'get_movies_state.dart';

class GetMoviesCubit extends Cubit<GetMoviesState> {
  GetMoviesCubit({required this.moviesRepository}) : super(GetMoviesInitial());
  MoviesRepository moviesRepository;
  late List<MovieModel>moviesData =[];

  Future<List<MovieModel>> fetchMovies() async {
    try {
      emit(GetMoviesLoading());
      final data = await moviesRepository.getMovies() ;
      if (data.isNotEmpty) {
        emit(GetMoviesLoadedSuccess());
        moviesData = (data).map((e) => MovieModel.fromJson(e)).toList();
        print("movies are: ${moviesData.toList()}");
        return moviesData;

      }
      emit(GetMoviesError());
      throw Exception();
    } catch (e) {
      emit(GetMoviesError());
      print(e.toString());
      return [];
    }
  }
}
