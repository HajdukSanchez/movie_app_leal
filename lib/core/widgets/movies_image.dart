import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/image_path_generator.dart';

class MoviesImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final ImageSize imageSize;

  const MoviesImage({
    Key? key,
    required this.width,
    required this.height,
    this.imageSize = ImageSize.w500,
    this.imagePath = '/7q448EVOnuE3gVAx24krzO7SNXM.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        setImagePathIntoUrl(imagePath, imageSize: ImageSize.w500),
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
