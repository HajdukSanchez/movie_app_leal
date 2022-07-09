import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/core/util/url_path_converter.dart';
import 'package:movies_app_leal/features/tv_show/data/models/tv_show_model.dart';
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

class TvShowRemoteDataSourceImpl implements TvShowRemoteDataSource {
  final http.Client client;
  final UrlPathConverter urlPathConverter;

  TvShowRemoteDataSourceImpl({required this.client, required this.urlPathConverter});

  @override
  Future<List<TvShow>> getAiringTodayTvShows() async {
    final uri = urlPathConverter.convertDataToUriPath("airing_today");
    final response = await client.get(uri, headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      // Convert response to a list of TvShowModel
      final tvShows =
          (jsonBody["results"] as List).map((tvShow) => TvShowModel.fromJson(tvShow)).toList();
      return tvShows;
    } else {
      throw ServerException();
    }
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
