import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movietask/features/home/detailscreen.dart';
import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (query) {
            context.read<MovieBloc>().add(SearchMovies(query));
          },
          decoration: const InputDecoration(
            hintText: 'Search Movies...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            if (state.movies.isEmpty) {
              return const Center(child: Text('No movies found.'));
            }
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  leading: movie.imageUrl != null
                      ? Image.network(movie.imageUrl!)
                      : const Icon(Icons.broken_image),
                  title: Text(movie.name ?? 'Unknown'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          }

          return const Center(child: Text('Search for movies...'));
        },
      ),
    );
  }
}
