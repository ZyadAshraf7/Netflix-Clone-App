import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_coming_soon_movies/get_comingSoonMovies.dart';

part 'coming_soon_movies_state.dart';

class ComingSoonMoviesCubit extends Cubit<ComingSoonMoviesState> {
  ComingSoonMoviesCubit({required this.comingSoonMoviesRepository}) : super(ComingSoonMoviesInitial());
  ComingSoonMoviesRepository comingSoonMoviesRepository;
  late List<MovieModel>comingSoonMoviesData=[];

  Future<void>fetchComingSoonMovies()async {
    try{
      emit(ComingSoonMoviesLoading());
      final data = await comingSoonMoviesRepository.getComingSoonMovies();
      if (data.isNotEmpty) {
        emit(ComingSoonMoviesLoadedSuccess());
        comingSoonMoviesData = (data).map((e) => MovieModel.fromJson(e)).toList();
      }else{
        emit(ComingSoonMoviesError());
      }
    }catch(e){
      emit(ComingSoonMoviesError());
      print(e.toString());
    }
  }
}
