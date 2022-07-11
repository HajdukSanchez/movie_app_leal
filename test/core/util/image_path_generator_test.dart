import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app_leal/core/util/image_path_generator.dart';

void main() {
  group("should ", () {
    test('should generate a correct image url', () async {
      // arrange
      const testImagePath = "/7q448EVOnuE3gVAx24krzO7SNXM.jpg";
      // act
      final result = setImagePathIntoUrl(testImagePath);
      // assert
      const expectedUrl = "https://image.tmdb.org/t/p/w500/7q448EVOnuE3gVAx24krzO7SNXM.jpg";
      expect(expectedUrl, result);
    });
    test('should generate a correct image url with original size', () async {
      // arrange
      const testImagePath = "/7q448EVOnuE3gVAx24krzO7SNXM.jpg";
      // act
      final result = setImagePathIntoUrl(testImagePath, imageSize: ImageSize.original);
      // assert
      const expectedUrl = "https://image.tmdb.org/t/p/original/7q448EVOnuE3gVAx24krzO7SNXM.jpg";
      expect(expectedUrl, result);
    });
  });
}
