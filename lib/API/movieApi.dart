import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:peliculas/API/movie_json.dart';

class MovieBloc extends Cubit<List<Movie>> {
  MovieBloc() : super([]);

  final dio = Dio();

  void fetchMovies() async {
    final response = await dio.get('https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=fa3e844ce31744388e07fa47c7c5d8c3');
    if (response.statusCode == 200) {
      final List<Movie> movies = (response.data['results'] as List)
          .map((data) => Movie.fromJson(data))
          .toList();
      emit(movies);
    } else {
      throw Exception('Error en la solicitud');
    }
  }
}
