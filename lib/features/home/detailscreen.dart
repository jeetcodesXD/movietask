import 'package:flutter/material.dart';
import 'package:movietask/dataprovider/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  final Movie movie;

  const DetailsScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.name ?? '')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(movie.imageUrl ?? ''),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                movie.name ?? '',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movie.summary ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
