import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSettings() {
      // TODO: Add logout
    }

    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: const Text("Home"),
          actions: [
            MoviesActionButton(
              icon: Icons.settings_rounded,
              function: _onSettings,
              iconColor: grey,
            ),
          ],
        ),
        body: SingleChildScrollView(
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
        ));
  }
}
