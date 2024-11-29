import 'package:bloc/bloc.dart';
import 'package:movietask/dataprovider/remote_datasource.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiService apiService;

  MovieBloc(this.apiService) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await apiService.fetchMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to fetch movies'));
      }
    });

    on<SearchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await apiService.searchMovies(event.query);
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to fetch movies'));
      }
    });
  }
}
