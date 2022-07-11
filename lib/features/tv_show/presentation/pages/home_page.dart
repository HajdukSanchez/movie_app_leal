import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_list.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (BuildContext context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                MovieList(
                    listTitle: "Popular", tvShows: state.lists?[TvShowListType.popular] ?? []),
                MovieList(
                  listTitle: "Recommended",
                  posterType: MoviePosterSize.normal,
                  tvShows: state.lists?[TvShowListType.recommended] ?? [],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
