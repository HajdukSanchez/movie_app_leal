import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/set_starts.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_image.dart';

class MoviePoster extends StatelessWidget {
  final bool fullPoster;

  const MoviePoster({Key? key, this.fullPoster = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fullPoster ? const _BigPoster() : const _SmallPoster();
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

class _BigPoster extends StatelessWidget {
  const _BigPoster({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onWatchNow() {}

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
                      onPressed: _onWatchNow,
                      width: 120,
                      hasMargin: false,
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

class _PosterStars extends StatelessWidget {
  final double raiting;

  const _PosterStars({
    Key? key,
    required this.raiting,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
