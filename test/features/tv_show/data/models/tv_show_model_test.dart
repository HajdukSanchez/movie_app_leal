import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture.dart';
import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/features/tv_show/data/models/tv_show_model.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

void main() {
  test('should be a subclass of Entity TvShow', () async {
    // assert
    expect(testTvShowModel, isA<TvShow>());
  });

  group("fromJson", () {
    test('should return a valid model', () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("tv_show.json"));
      // act
      final result = TvShowModel.fromJson(jsonMap);
      // assert
      expect(result, testTvShowModel);
    });
  });
}
