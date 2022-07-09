import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

class TvShowModel extends TvShow {
  /// Model of a TV Show entity
  const TvShowModel({
    required id,
    required name,
    required posterPath,
    required voteAverage,
    required firstAirDate,
    required overview,
  }) : super(
          id: id,
          name: name,
          posterPath: posterPath,
          voteAverage: voteAverage,
          firstAirDate: firstAirDate,
          overview: overview,
        );

  /// Convert a Json response to a [TvShowModel] object
  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json["id"],
      name: json["name"],
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"],
      firstAirDate: json["first_air_date"],
      overview: json["overview"],
    );
  }
}
