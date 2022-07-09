import 'package:movies_app_leal/features/tv_show/data/models/tv_show_model.dart';
import 'package:movies_app_leal/features/tv_show/domain/entities/tv_show.dart';

/// Test variable to ejemplify a new tv show
const testTvShowModel = TvShowModel(
  id: 1,
  name: "test",
  posterPath: "test",
  voteAverage: 1.0,
  firstAirDate: "2016-07-15",
  overview: "test",
);

const TvShow testTvShow = testTvShowModel;

/// Test variable to ejemplify a new popular tv show list
final testPopularTvShows = [testTvShow, testTvShow];

/// Test Uri to ejemplify data API url
final testUri = Uri.parse("https://api.themoviedb.org/3/tv");

/// Test path to ejemplify data API url
const String testPath = "airing_today";

/// Full URL to ejemplify data API url
const String testFullUrl =
    "https://api.themoviedb.org/3/tv/airing_today?api_key=56da94afef2f8be1549d9cbe18339632&language=en-US&page=1";
