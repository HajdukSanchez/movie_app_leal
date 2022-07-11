import 'package:flutter/material.dart';
import 'package:movies_app_leal/core/theme/theme_data.dart';

class MoviesImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const MoviesImage({
    Key? key,
    required this.width,
    required this.height,
    this.imagePath = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        "https://image.tmdb.org/t/p/w500/$imagePath",
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          return progress == null
              ? child
              : const Center(
                  child: CircularProgressIndicator(
                    color: yellow,
                  ),
                );
        },
      ),
    );
  }
}
