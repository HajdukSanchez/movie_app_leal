import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/features/tv_show/domain/usecases/get_details_tv_shows.dart';
import 'package:movies_app_leal/features/tv_show/domain/repositories/tv_show_repository.dart';

class MockTvShowRepository extends Mock implements TvShowRepository {}

void main() {
  late GetDetailsTvShow usecase;
  late MockTvShowRepository mockTvShowRepository;

  const String testId = "1"; // Test ID to ejemplify ID of a TV Show.

  setUp(() {
    mockTvShowRepository = MockTvShowRepository();
    usecase = GetDetailsTvShow(mockTvShowRepository);
  });

  test('should get details for a TV show by ID from the repository', () async {
    // arrange
    when(() => mockTvShowRepository.getDetailsTvShow(testId))
        .thenAnswer((_) async => const Right(testTvShow));
    // act
    final result = await usecase(const Params(id: testId));
    // assert
    expect(result, const Right(testTvShow));
    verify(() => mockTvShowRepository.getDetailsTvShow(testId));
    verifyNoMoreInteractions(mockTvShowRepository); // No more interactions with repository
  });
}
