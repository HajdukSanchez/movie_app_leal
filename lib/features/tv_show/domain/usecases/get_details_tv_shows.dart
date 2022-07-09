import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';

class GetDetailsTvShow extends UseCase<TvShow, Params> {
  /// Repository to handle the method implementations of the usecase.
  final TvShowRepository tvShowRepository;

  GetDetailsTvShow(this.tvShowRepository);

  @override
  Future<Either<Failure, TvShow>> call(Params params) async {
    return await tvShowRepository.getDetailsTvShow(params.id);
  }
}

/// Class with parameters to get the details of a specific TV Show.
class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object> get props => [id];
}
