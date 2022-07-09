import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

/// Test variable to ejemplify a new tv show
final testTvShow = TvShow(
  id: 1,
  name: "test",
  posterPath: "test",
  voteAverage: 1.0,
  firstAirDate: DateTime.now(),
  overview: "test",
);

/// Test variable to ejemplify a new popular tv show list
final testPopularTvShows = [testTvShow, testTvShow];
