import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietask/dataprovider/remote_datasource.dart';
import 'package:movietask/features/bloc/movie_bloc.dart';
import 'package:movietask/features/home/homescreen.dart';
import 'package:movietask/features/splashscreen/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieBloc(ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netflix Clone',
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}
