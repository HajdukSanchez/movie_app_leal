import 'package:dartz/dartz.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';

class GetAiringTodayTvShows extends UseCase<List<TvShow>, NoParams> {
  /// Repository to handle the method implementations of the usecase.
  final TvShowRepository tvShowRepository;

  GetAiringTodayTvShows(this.tvShowRepository);

  @override
  Future<Either<Failure, List<TvShow>>> call(NoParams params) async {
    return await tvShowRepository.getAiringTodayTvShows();
  }
}
