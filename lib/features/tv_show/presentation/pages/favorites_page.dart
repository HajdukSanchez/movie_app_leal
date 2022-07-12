import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/widgets/information_container.dart';
import 'package:movies_app_leal/core/widgets/list_separator.dart';
import 'package:movies_app_leal/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (context, state) {
          final list = state.lists?[TvShowListType.recommended] ?? [];
          if (list.isEmpty) {
            return const InformationContainer(
              icon: Icons.favorite_border_rounded,
              message: 'No favorites yet',
            );
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return MoviePoster(
                  posterType: MoviePosterSize.normal,
                  tvShow: list[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const ListSeparator(),
            ),
          );
        },
      ),
    );
  }
}
