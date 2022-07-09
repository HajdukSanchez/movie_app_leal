import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/login.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late Login usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = Login(mockAuthRepository);
  });

  test('should get auth data for login info from the repository', () async {
    // arrange
    when(() => mockAuthRepository.login(testAuthUser))
        .thenAnswer((_) async => const Right(testAuthUser));
    // act
    final result = await usecase(const Params(testAuthUser));
    // assert
    expect(result, const Right(testAuthUser));
    verify(() => mockAuthRepository.login(testAuthUser));
    verifyNoMoreInteractions(mockAuthRepository); // No more interactions with repository
  });
}
