import 'package:http/http.dart' as http;

import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

abstract class TvShowRemoteDataSource {
  /// Get popular TV Shows from remote server
  Future<List<TvShow>> getPopularTvShows();

  /// Get recommended TV Shows from remote server
  Future<List<TvShow>> getRecommendedTvShows();

  /// Get details from a TV Show from remote server
  Future<TvShow> getDetailsTvShow(int id);

  /// Get today airing TV Shows from remote server
  Future<List<TvShow>> getAiringTodayTvShows();
}

const baseUrl = "api.themoviedb.org/3/tv"; // TODO: add to a .env file
const baseQueryParams = {
  "api_key": "56da94afef2f8be1549d9cbe18339632",
  "language": "en-US",
  "page": 1,
}; // TODO: add to a .env file

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final http.Client client;

  TvShowRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TvShow>> getAiringTodayTvShows() {
    throw UnimplementedError();
  }

  @override
  Future<List<TvShow>> getPopularTvShows() {
    throw UnimplementedError();
  }

  @override
  Future<List<TvShow>> getRecommendedTvShows() {
    throw UnimplementedError();
  }

  @override
  Future<TvShow> getDetailsTvShow(int id) {
    throw UnimplementedError();
  }
}
