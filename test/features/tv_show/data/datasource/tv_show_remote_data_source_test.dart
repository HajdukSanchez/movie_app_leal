import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture.dart';
import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/core/util/url_path_converter.dart';
import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockUrlPathConverter extends Mock implements UrlPathConverter {}

void main() {
  late TvShowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late MockUrlPathConverter mockUrlPathConverter;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockUrlPathConverter = MockUrlPathConverter();
    dataSource =
        TvShowRemoteDataSourceImpl(client: mockHttpClient, urlPathConverter: mockUrlPathConverter);
  });

  void _mockSetUpHttpClient200() {
    when(
      () => mockHttpClient.get(
        testUri,
        headers: {"Content-Type": "application/json"},
      ),
    ).thenAnswer((_) async => Future.value(http.Response(fixture("tv_shows.json"), 200)));
  }

  void _mockSetUpHttpClient400() {
    when(
      () => mockHttpClient.get(
        testUri,
        headers: {"Content-Type": "application/json"},
      ),
    ).thenAnswer((_) async => Future.value(http.Response("Something went wrong", 404)));
  }

  group("getAiringTodayTvShows", () {
    setUp(() {
      when(() => mockUrlPathConverter.convertDataToUriPath(airingPath)).thenReturn(testUri);
    });

    test("Should perfom a GET request on a URL with application/json header", () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      await dataSource.getAiringTodayTvShows();
      // assert
      verify(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      );
    });

    test('should return a list of tv shows when response code is 200', () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      final result = await dataSource.getAiringTodayTvShows();
      // assert
      expect(result, equals(testPopularTvShows));
    });

    test('should return a list of tv shows when response code is different from 200', () async {
      // arrange
      _mockSetUpHttpClient400();
      // act
      final call = dataSource.getAiringTodayTvShows;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group("getPopularTvShows", () {
    setUp(() {
      when(() => mockUrlPathConverter.convertDataToUriPath(popularPath)).thenReturn(testUri);
    });

    test("Should perfom a GET request on a URL with application/json header", () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      await dataSource.getPopularTvShows();
      // assert
      verify(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      );
    });

    test('should return a list of tv shows when response code is 200', () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      final result = await dataSource.getPopularTvShows();
      // assert
      expect(result, equals(testPopularTvShows));
    });

    test('should return a list of tv shows when response code is different from 200', () async {
      // arrange
      _mockSetUpHttpClient400();
      // act
      final call = dataSource.getPopularTvShows;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group("getRecommendedTvShows", () {
    setUp(() {
      when(() => mockUrlPathConverter.convertDataToUriPath(recommendedPath)).thenReturn(testUri);
    });

    test("Should perfom a GET request on a URL with application/json header", () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      await dataSource.getRecommendedTvShows();
      // assert
      verify(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      );
    });

    test('should return a list of tv shows when response code is 200', () async {
      //arrange
      _mockSetUpHttpClient200();
      // act
      final result = await dataSource.getRecommendedTvShows();
      // assert
      expect(result, equals(testPopularTvShows));
    });

    test('should return a list of tv shows when response code is different from 200', () async {
      // arrange
      _mockSetUpHttpClient400();
      // act
      final call = dataSource.getRecommendedTvShows;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
    });
  });

  group("getDetailsTvShow", () {
    setUp(() {
      when(() => mockUrlPathConverter.convertDataToUriPath(detailsPath)).thenReturn(testUri);
      when(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      ).thenAnswer((_) async => Future.value(http.Response(fixture("tv_show.json"), 200)));
    });

    test("Should perfom a GET request on a URL with application/json header", () async {
      // act
      await dataSource.getDetailsTvShow(detailsPath);
      // assert
      verify(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      );
    });

    test('should return a list of tv shows when response code is 200', () async {
      // act
      final result = await dataSource.getDetailsTvShow(detailsPath);
      // assert
      expect(result, equals(testTvShow));
    });

    test('should return a list of tv shows when response code is different from 200', () async {
      // arrange
      _mockSetUpHttpClient400();
      // act
      final call = dataSource.getDetailsTvShow;
      // assert
      expect(() => call(detailsPath), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
