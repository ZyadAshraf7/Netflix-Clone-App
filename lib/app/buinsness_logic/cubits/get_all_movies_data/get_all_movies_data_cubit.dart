import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:netflix_app/app/data/models/movie_model.dart';
import 'package:netflix_app/app/data/repositories/get_all_movies_data/get_all_movies_data.dart';

part 'get_all_movies_data_state.dart';

class GetAllMoviesDataCubit extends Cubit<GetAllMoviesDataState> {
  GetAllMoviesDataCubit({required this.allMoviesDataRepository}) : super(GetAllMoviesDataInitial());
  AllMoviesDataRepository allMoviesDataRepository;
  late List<MovieModel>allMoviesData=[];

  Future<void>fetchAllMoviesData()async{
    try{
      emit(GetAllMoviesDataLoading());
      final data = await allMoviesDataRepository.getAllMoviesData();
      allMoviesData=(data).map((movie) => MovieModel.fromJson(movie)).toList();
      if(allMoviesData.isNotEmpty) {
        emit(GetAllMoviesDataLoadedSuccess());
      }
    }catch(e){
      emit(GetAllMoviesDataError());
      print(e.toString());
    }
  }
  MovieModel findMovieById(String id){
    return allMoviesData.firstWhere((movie) => movie.id==id);
  }
}
