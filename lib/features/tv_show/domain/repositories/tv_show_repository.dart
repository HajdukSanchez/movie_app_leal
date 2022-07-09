import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

/// Repository of methods to have usecases of TV Shows
abstract class TvShowRepository {
  /// Search for popular TV Shows.
  ///
  /// Gets a list of Tv shows that are popular.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getPopularTvShows();

  /// Search for recommended TV Shows.
  ///
  /// Gets a list of Tv shows that are recommended.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows();

  /// Search for details of a specific TV Shows.
  ///
  /// Gets details of a Tv shows based on the [id].
  /// If there are no results, an failure is returned.
  Future<Either<Failure, TvShow>> getDetailsTvShow(String id);

  /// Search for todays airing TV Shows.
  ///
  /// Gets a list of todays airing Tv shows.
  /// If there are no results, an failure is returned.
  Future<Either<Failure, List<TvShow>>> getAiringTodayTvShows();
}
