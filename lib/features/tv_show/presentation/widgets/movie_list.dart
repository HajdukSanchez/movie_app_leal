import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/routes/routes.dart';
import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class MovieList extends StatelessWidget {
  final String listTitle;
  final MoviePosterSize posterType;

  const MovieList({
    Key? key,
    required this.listTitle,
    this.posterType = MoviePosterSize.small,
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
            posterType: posterType,
          ),
          if (posterType == MoviePosterSize.small) const _SeeAllButton(),
        ],
      ),
    );
  }
}

class _ListOfMovies extends StatelessWidget {
  final MoviePosterSize posterType;

  const _ListOfMovies({
    Key? key,
    required this.posterType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10000, (i) => 'Item $i');
    final double posterHeight;

    switch (posterType) {
      case MoviePosterSize.small:
        posterHeight = 260;
        break;
      case MoviePosterSize.normal:
        posterHeight = 150;
        break;
      case MoviePosterSize.big:
        posterHeight = 400;
        break;
      default:
        posterHeight = 260;
        break;
    }

    return SizedBox(
      height: posterHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal, // Direction horizontal of the list
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 20),
        itemBuilder: (BuildContext context, int index) => MoviePoster(
          posterType: posterType,
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
    void _onSeeAll() {
      Navigator.pushNamed(context, RoutesPages.posterDetail.name);
    }

    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: GestureDetector(
        onTap: _onSeeAll,
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
      ),
    );
  }
}
