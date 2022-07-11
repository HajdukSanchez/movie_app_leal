import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/set_starts.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_image.dart';

/// Enum with Movie Poster sizes.
enum MoviePosterSize {
  small,
  normal,
  big,
}

class MoviePoster extends StatelessWidget {
  final MoviePosterSize posterType;

  const MoviePoster({Key? key, this.posterType = MoviePosterSize.small}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onWatchNow() {}

    switch (posterType) {
      case MoviePosterSize.small:
        return const _SmallPoster();
      case MoviePosterSize.normal:
        return _NormalPoster(
          onWatchNow: _onWatchNow,
        );
      case MoviePosterSize.big:
        return _BigPoster(
          onWatchNow: _onWatchNow,
        );
      default:
        return const _SmallPoster();
    }
  }
}

class _SmallPoster extends StatelessWidget {
  const _SmallPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          MoviesImage(
            width: 150,
            height: 200,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Text image",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          _PosterStars(
            raiting: 10,
          )
        ],
      ),
    );
  }
}

class _NormalPoster extends StatelessWidget {
  final void Function() onWatchNow;

  const _NormalPoster({
    Key? key,
    required this.onWatchNow,
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
          const MoviesImage(
            width: 130,
            height: 150,
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
                const Text(
                  "Text image",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "IMDb: 9,4",
                    style: TextStyle(
                      fontSize: 12,
                      color: grey,
                    ),
                  ),
                ),
                const _PosterStars(raiting: 10),
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

  const _BigPoster({
    Key? key,
    required this.onWatchNow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MoviesImage(
            width: 300,
            height: 350,
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Text image",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "IMDb: 9,4",
                  style: TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
              ),
              const _PosterStars(raiting: 10, centered: true),
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
  final double raiting;
  final bool centered;

  const _PosterStars({
    Key? key,
    required this.raiting,
    this.centered = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          ...setStarIconByRaiting(raiting)
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
