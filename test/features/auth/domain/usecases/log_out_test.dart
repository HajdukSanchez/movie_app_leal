import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/log_out.dart';
import 'package:movies_app_leal/features/auth/domain/repositories/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late LogOut usecase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    usecase = LogOut(mockAuthRepository);
  });

  test('should get a False value when logout is successfull', () async {
    // arrange
    when(() => mockAuthRepository.logOut()).thenAnswer((_) async => const Right(false));
    // act
    final result = await usecase(NoParams());
    // assert
    expect(result, const Right(false));
    verify(() => mockAuthRepository.logOut());
    verifyNoMoreInteractions(mockAuthRepository); // No more interactions with repository
  });
}
