import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';
import 'package:movies_app_leal/features/tv_show/data/repositories/tv_show_repository_impl.dart';

class MockTvShowRemoteDataSource extends Mock implements TvShowRemoteDataSource {}

void main() {
  late MockTvShowRemoteDataSource mockTvShowRemoteDataSource;
  late TvShowRepositoryImpl repository;

  setUp(() {
    mockTvShowRemoteDataSource = MockTvShowRemoteDataSource();
    repository = TvShowRepositoryImpl(remoteDataSource: mockTvShowRemoteDataSource);
  });

  group("getAiringTodayTvShows", () {
    setUp(() {
      when(() => mockTvShowRemoteDataSource.getAiringTodayTvShows())
          .thenAnswer((_) async => testPopularTvShows);
    });

    test('should return remote data when call to remote data source is successfull', () async {
      // act
      final result = await repository.getAiringTodayTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getAiringTodayTvShows());
      expect(result, equals(Right(testPopularTvShows)));
    });

    test('should return a failure when call to remote data source is unsuccessfull', () async {
      // arrange
      when(() => mockTvShowRemoteDataSource.getAiringTodayTvShows()).thenThrow(ServerException());
      // act
      final result = await repository.getAiringTodayTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getAiringTodayTvShows());
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("getPopularTvShows", () {
    setUp(() {
      when(() => mockTvShowRemoteDataSource.getPopularTvShows())
          .thenAnswer((_) async => testPopularTvShows);
    });

    test('should return remote data when call to remote data source is successfull', () async {
      // act
      final result = await repository.getPopularTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getPopularTvShows());
      expect(result, equals(Right(testPopularTvShows)));
    });

    test('should return a failure when call to remote data source is unsuccessfull', () async {
      // arrange
      when(() => mockTvShowRemoteDataSource.getPopularTvShows()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getPopularTvShows());
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("getRecommendedTvShows", () {
    setUp(() {
      when(() => mockTvShowRemoteDataSource.getRecommendedTvShows())
          .thenAnswer((_) async => testPopularTvShows);
    });

    test('should return remote data when call to remote data source is successfull', () async {
      // act
      final result = await repository.getRecommendedTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getRecommendedTvShows());
      expect(result, equals(Right(testPopularTvShows)));
    });

    test('should return a failure when call to remote data source is unsuccessfull', () async {
      // arrange
      when(() => mockTvShowRemoteDataSource.getRecommendedTvShows()).thenThrow(ServerException());
      // act
      final result = await repository.getRecommendedTvShows();
      // assert
      verify(() => mockTvShowRemoteDataSource.getRecommendedTvShows());
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("getDetailsTvShow", () {
    const String testTvShowID = "1";

    setUp(() {
      when(() => mockTvShowRemoteDataSource.getDetailsTvShow(testTvShowID))
          .thenAnswer((_) async => testTvShow);
    });

    test('should return remote data when call to remote data source is successfull', () async {
      // act
      final result = await repository.getDetailsTvShow(testTvShowID);
      // assert
      verify(() => mockTvShowRemoteDataSource.getDetailsTvShow(testTvShowID));
      expect(result, equals(const Right(testTvShow)));
    });

    test('should return a failure when call to remote data source is unsuccessfull', () async {
      // arrange
      when(() => mockTvShowRemoteDataSource.getDetailsTvShow(testTvShowID))
          .thenThrow(ServerException());
      // act
      final result = await repository.getDetailsTvShow(testTvShowID);
      // assert
      verify(() => mockTvShowRemoteDataSource.getDetailsTvShow(testTvShowID));
      expect(result, equals(Left(ServerFailure())));
    });
  });
}
