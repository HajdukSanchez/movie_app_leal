import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_poster.dart';

class PosterDetailPage extends StatelessWidget {
  const PosterDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        title: const Text(
          "Popular",
          style: TextStyle(color: white),
        ),
        backgroundColor: black,
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: CarouselSlider.builder(
            itemCount: 100,
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: false,
              height: MediaQuery.of(context).size.height * 0.8,
            ),
            itemBuilder: (ctx, index, realIdx) {
              return Container();
              // return const MoviePoster(
              //   posterType: MoviePosterSize.big,
              // );
            },
          ),
        ),
      ),
    );
  }
}