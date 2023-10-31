import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas/API/_movieCubit.dart';
import 'package:peliculas/API/listMovie.dart';

/* void main() {
  runApp(MaterialApp(
    title: 'Movie List',
    home: BlocProvider(
      create: (context) => MovieCubit(),
      child: MovieList(),
    ),
  ));
} */



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Movie List',
    home: BlocProvider(
      create: (context) => MovieCubit(),
      child: MovieList(),
    ),
  );
  }
}
