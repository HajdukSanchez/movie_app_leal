import 'package:equatable/equatable.dart';

/// TV Show entity with default values.
class TvShow extends Equatable {
  /// ID of the TV Show.
  final int id;

  /// Average rating of the TV Show.
  final num voteAverage;

  /// First air date of the TV Show.
  final String firstAirDate;

  /// Name of the TV Show.
  final String name;

  /// URL path of the poster of the TV Show.
  final String posterPath;

  /// Overview of the TV Show.
  final String overview;

  const TvShow({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.voteAverage,
    required this.firstAirDate,
    required this.overview,
  });

  @override
  List<Object?> get props => [id, name, posterPath, voteAverage, firstAirDate, overview];
}
