import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';

/// Alias for a Future of a List of TvShows.
typedef _TvShowsList = Future<List<TvShow>> Function();

/// Alias for a Future of a TvShow.
typedef _TvShowDetails = Future<TvShow> Function();

class TvShowRepositoryImpl extends TvShowRepository {
  final TvShowRemoteDataSource remoteDataSource;

  TvShowRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TvShow>>> getAiringTodayTvShows() async {
    return await _getTvShows(() => remoteDataSource.getAiringTodayTvShows());
  }

  @override
  Future<Either<Failure, List<TvShow>>> getPopularTvShows() async {
    return await _getTvShows(() => remoteDataSource.getPopularTvShows());
  }

  @override
  Future<Either<Failure, List<TvShow>>> getRecommendedTvShows() async {
    return await _getTvShows(() => remoteDataSource.getRecommendedTvShows());
  }

  @override
  Future<Either<Failure, TvShow>> getDetailsTvShow(String id) async {
    return await _getTvShowDetails(() => remoteDataSource.getDetailsTvShow(id));
  }

  /// Get a list of TvShows depends on the remote method
  Future<Either<Failure, List<TvShow>>> _getTvShows(_TvShowsList function) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  /// Get one TvShow depends on the remote method
  Future<Either<Failure, TvShow>> _getTvShowDetails(_TvShowDetails function) async {
    try {
      final result = await function();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
