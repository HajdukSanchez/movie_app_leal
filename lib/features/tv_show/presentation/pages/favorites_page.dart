import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return const MoviePoster(
              posterType: MoviePosterSize.normal,
            );
          },
          separatorBuilder: (BuildContext context, int index) => const _Separator(),
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  const _Separator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: grey),
        ),
      ),
    );
  }
}
