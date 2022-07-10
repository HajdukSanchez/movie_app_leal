import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class MovieList extends StatelessWidget {
  final String listTitle;
  final bool fullPoster;

  const MovieList({
    Key? key,
    required this.listTitle,
    this.fullPoster = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: grey),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MoviesTitle(
            text: listTitle,
          ),
          _ListOfMovies(
            fullPoster: fullPoster,
          ),
          if (!fullPoster) const _SeeAllButton(),
        ],
      ),
    );
  }
}

class _ListOfMovies extends StatelessWidget {
  final bool fullPoster;

  const _ListOfMovies({
    Key? key,
    required this.fullPoster,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');

    return SizedBox(
      height: fullPoster ? 150 : 260,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // Direction horizontal of the list
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (BuildContext context, int index) => MoviePoster(
          fullPoster: fullPoster,
        ),
      ),
    );
  }
}

class _SeeAllButton extends StatelessWidget {
  const _SeeAllButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Text(
            "See All",
            style: TextStyle(color: yellow, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: yellow,
          ),
        ],
      ),
    );
  }
}
