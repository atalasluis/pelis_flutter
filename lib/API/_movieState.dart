

import 'package:peliculas/API/movie_json.dart';

class MoviesLoadedState  {
  final List<Movie> movies;

  MoviesLoadedState(this.movies);

  @override
  List<Object> get props => [movies];
}