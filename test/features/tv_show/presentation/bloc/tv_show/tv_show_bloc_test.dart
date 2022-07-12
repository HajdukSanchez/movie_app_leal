import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movies_app_leal/core/util/failure_to_message.dart';

import 'package:movies_app_leal/features/tv_show/domain/usecases/get_airing_today_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_details_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_popular_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_recommended_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';

class MockGetAiringTodayTvShows extends Mock implements GetAiringTodayTvShows {}

class MockGetDetailsTvShows extends Mock implements GetDetailsTvShow {}

class MockGetPopularTvShows extends Mock implements GetPopularTvShow {}

class MockGetRecommendedTvShows extends Mock implements GetRecommendedTvShow {}

class MockMessage extends Mock implements Message {}

void main() {
  late TvShowBloc bloc;
  late MockGetAiringTodayTvShows mockGetAiringTodayTvShows;
  late MockGetDetailsTvShows mockGetDetailsTvShows;
  late MockGetPopularTvShows mockGetPopularTvShows;
  late MockGetRecommendedTvShows mockGetRecommendedTvShows;
  late MockMessage mockMessage;

  setUp(() {
    mockGetAiringTodayTvShows = MockGetAiringTodayTvShows();
    mockGetDetailsTvShows = MockGetDetailsTvShows();
    mockGetPopularTvShows = MockGetPopularTvShows();
    mockGetRecommendedTvShows = MockGetRecommendedTvShows();
    mockMessage = MockMessage();

    bloc = TvShowBloc(
      getAiringTodayTvShows: mockGetAiringTodayTvShows,
      getDetailsTvShows: mockGetDetailsTvShows,
      getPopularTvShows: mockGetPopularTvShows,
      getRecommendedTvShows: mockGetRecommendedTvShows,
      message: mockMessage,
    );
  });
}
