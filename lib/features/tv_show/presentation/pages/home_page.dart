import 'package:flutter/material.dart';

import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: const [
            MovieList(listTitle: "Popular"),
            MovieList(
              listTitle: "Recommended",
              fullPoster: true,
            ),
          ],
        ),
      ),
    );
  }
}
