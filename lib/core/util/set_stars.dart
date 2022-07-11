import 'package:flutter/material.dart';

/// Function to create a list for add start into a set
List<IconData> setStarIconByRating(double rating) {
  double average = rating / 2;
  double module = rating % 2; // Value to add half star
  double maxAverage = 5;
  bool moduleAdd = false; // Flag to add a half star

  List<IconData> stars = [];

  for (var i = 1; i <= maxAverage; i++) {
    if (i <= average) {
      stars.add(Icons.star_rounded); // Complete star
    } else {
      if (module > 0 && !moduleAdd) {
        stars.add(Icons.star_half_rounded); // Half star
        moduleAdd = true; // No more half stars
      } else {
        stars.add(Icons.star_outline_rounded); // Empty star
      }
    }
  }

  return stars;
}
