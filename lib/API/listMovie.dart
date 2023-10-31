import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas/API/_movieCubit.dart';
import 'package:peliculas/API/_movieState.dart';
import 'package:peliculas/API/movie_json.dart';

class MovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieCubit = BlocProvider.of<MovieCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: BlocBuilder<MovieCubit, MoviesLoadedState>(
        builder: (context, state) {
          if (state.movies.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            final movies = state.movies;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  title: Text('Title: Peliculas'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Page: ${movie.page}'),
                      Text('Total Pages: ${movie.totalPages}'),
                      // Agregar más campos de Movie...
                      //if (movie.results.isNotEmpty){
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var result in movie.results)
                            //Text('Movie Titles:'),
                            Text(result.title),
                          ],
                        ),
                      //}
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
