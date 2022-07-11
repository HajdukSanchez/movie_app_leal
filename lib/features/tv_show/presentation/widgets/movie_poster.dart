import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/modify_text_length.dart';
import 'package:movies_app_leal/core/util/set_stars.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_image.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

/// Enum with Movie Poster sizes.
enum MoviePosterSize {
  small,
  normal,
  big,
}

class MoviePoster extends StatelessWidget {
  final MoviePosterSize posterType;
  final TvShow tvShow;

  const MoviePoster({
    Key? key,
    required this.tvShow,
    this.posterType = MoviePosterSize.small,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onWatchNow() {
      // TODO: implement _onWatchNow
    }

    switch (posterType) {
      case MoviePosterSize.small:
        return _SmallPoster(
          tvShow: tvShow,
        );
      case MoviePosterSize.normal:
        return _NormalPoster(
          onWatchNow: _onWatchNow,
          tvShow: tvShow,
        );
      case MoviePosterSize.big:
        return _BigPoster(
          onWatchNow: _onWatchNow,
          tvShow: tvShow,
        );
      default:
        return _SmallPoster(
          tvShow: tvShow,
        );
    }
  }
}

class _SmallPoster extends StatelessWidget {
  final TvShow tvShow;

  const _SmallPoster({
    Key? key,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 150,
            height: 200,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            tvShow.name,
            style: const TextStyle(
              fontSize: 16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          _PosterStars(
            rating: double.parse(tvShow.voteAverage.toString()),
          )
        ],
      ),
    );
  }
}

class _NormalPoster extends StatelessWidget {
  final void Function() onWatchNow;
  final TvShow tvShow;

  const _NormalPoster({
    Key? key,
    required this.onWatchNow,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onFavorite() {}

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 130,
            height: 150,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            width: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subStringTextLength(25, tvShow.name),
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    "IMDb: ${tvShow.voteAverage}",
                    style: const TextStyle(
                      fontSize: 12,
                      color: grey,
                    ),
                  ),
                ),
                _PosterStars(rating: double.parse(tvShow.voteAverage.toString())),
                Row(
                  children: [
                    MoviesButton(
                      text: "Watch Now",
                      onPressed: onWatchNow,
                      width: 120,
                      hasMargin: false,
                    ),
                    MoviesActionButton(
                      icon: Icons.favorite_outline_rounded,
                      function: _onFavorite,
                      iconColor: grey,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BigPoster extends StatelessWidget {
  final void Function() onWatchNow;
  final TvShow tvShow;

  const _BigPoster({
    Key? key,
    required this.onWatchNow,
    required this.tvShow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviesImage(
            width: 300,
            height: 350,
            imagePath: tvShow.posterPath,
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  tvShow.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "IMDb: ${tvShow.voteAverage}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
              ),
              _PosterStars(rating: double.parse(tvShow.voteAverage.toString()), centered: true),
              MoviesButton(
                text: "Watch Now",
                onPressed: onWatchNow,
                width: 120,
                hasMargin: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PosterStars extends StatelessWidget {
  final double rating;
  final bool centered;

  const _PosterStars({
    Key? key,
    required this.rating,
    this.centered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          ...setStarIconByRating(rating)
              .map((iconType) => Icon(
                    iconType,
                    size: 15,
                    color: grey,
                  ))
              .toList()
        ],
      ),
    );
  }
}
