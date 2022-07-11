import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/image_path_generator.dart';
import 'package:movies_app_leal/core/widgets/movie_detail_button.dart';
import 'package:movies_app_leal/core/widgets/movies_image.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

class MovieView extends StatelessWidget {
  final TvShow tvShow;

  const MovieView({Key? key, required this.tvShow}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onGoToView() {
      // TODO: implement go to view
    }

    return SizedBox(
      child: Column(
        children: [
          MoviesImage(
            width: 320,
            height: 320,
            imagePath: tvShow.posterPath,
            imageSize: ImageSize.original,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: Text(
              tvShow.name,
              style: const TextStyle(fontSize: 30, color: white, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "IMDb: ${tvShow.voteAverage}",
            style: const TextStyle(fontSize: 15, color: grey, fontWeight: FontWeight.bold),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: MovieDetailButton(text: "Go to view", onPressed: _onGoToView),
          )
        ],
      ),
    );
  }
}
