import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_airing_today_tv_shows.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  late GetAiringTodayTvShows usecase;
  late MockTvShowRepository mockTvShowRepository;

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetAiringTodayTvShows(mockTvShowRepository);
  });

  test('should get airing today tv shows from the repository', () async {
    // arrange
    when(() => mockTvShowRepository.getAiringTodayTvShows())
        .thenAnswer((_) async => Right(testPopularTvShows));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, Right(testPopularTvShows));
    verify(() => mockTvShowRepository.getAiringTodayTvShows());
    verifyNoMoreInteractions(mockTvShowRepository); // No more interactions with repository
  });
}
