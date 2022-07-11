import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app_leal/core/util/set_stars.dart';

void main() {
  group("setStarIconByRating", () {
    test('should get 5 start length', () async {
      // act
      final result = setStarIconByRating(10);
      // assert
      expect(result.length, 5);
    });

    test('should get a correct array of stars icon with 10.0 in rating', () async {
      // act
      final result = setStarIconByRating(10.0);
      // assert
      const expectedList = [
        Icons.star_rounded,
        Icons.star_rounded,
        Icons.star_rounded,
        Icons.star_rounded,
        Icons.star_rounded
      ];
      expect(result, expectedList);
    });

    test('should get a correct array of stars icon with 5.0 in rating', () async {
      // act
      final result = setStarIconByRating(5.0);
      // assert
      const expectedList = [
        Icons.star_rounded,
        Icons.star_rounded,
        Icons.star_half_rounded,
        Icons.star_outline_rounded,
        Icons.star_outline_rounded
      ];
      expect(result, expectedList);
    });

    test('should get a correct array of stars icon with 0.0 in rating', () async {
      // act
      final result = setStarIconByRating(0.0);
      // assert
      const expectedList = [
        Icons.star_outline_rounded,
        Icons.star_outline_rounded,
        Icons.star_outline_rounded,
        Icons.star_outline_rounded,
        Icons.star_outline_rounded
      ];
      expect(result, expectedList);
    });
  });
}
