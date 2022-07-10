import 'package:flutter_test/flutter_test.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:movies_app_leal/features/auth/data/repositories/auth_repository_impl.dart';

class MockAuthRemoteDataSourceImpl extends Mock implements AuthRemoteDataSourceImpl {}

class MockAuthLocalDataSourceImpl extends Mock implements AuthLocalDataSourceImpl {}

void main() {
  late MockAuthRemoteDataSourceImpl mockAuthRemoteDataSourceImpl;
  late MockAuthLocalDataSourceImpl mockAuthLocalDataSourceImpl;
  late AuthRepositoryImpl repository;

  setUp(() {
    mockAuthRemoteDataSourceImpl = MockAuthRemoteDataSourceImpl();
    mockAuthLocalDataSourceImpl = MockAuthLocalDataSourceImpl();
    repository = AuthRepositoryImpl(
        remoteDataSource: mockAuthRemoteDataSourceImpl,
        localDataSource: mockAuthLocalDataSourceImpl);
  });

  group("login", () {
    test('should return an Auth data when it is a successfully login', () async {
      // arrange
      when(() => mockAuthRemoteDataSourceImpl.logInWithNameAndPassword(testAuthUserModel))
          .thenAnswer((_) async => testAuthUserModel);
      when(() => mockAuthLocalDataSourceImpl.cacheAuthData(testAuthUserModel))
          .thenAnswer((_) async => any);
      // act
      final result = await repository.login(testAuthUserModel);
      // assert
      expect(result, equals(const Right(testAuthUserModel)));
    });

    test('should return a ServeFailure when it is a unsuccefully login', () async {
      // arrange
      when(() => mockAuthRemoteDataSourceImpl.logInWithNameAndPassword(testAuthUserModel))
          .thenThrow(ServerException());
      // act
      // assert
      final result = await repository.login(testAuthUserModel);
      expect(result, equals(Left(ServerFailure())));
    });
  });

  group("logOut", () {
    test('should return True when it is a successfully logOut', () async {
      when(() => mockAuthLocalDataSourceImpl.logOut()).thenAnswer((_) async => true);
      // act
      final result = await repository.logOut();
      // assert
      expect(result, equals(const Right(true)));
    });

    test('should return a CacheFailure when it is a unsuccessfully logOut', () async {
      when(() => mockAuthLocalDataSourceImpl.logOut()).thenThrow(CacheException());
      // act
      final result = await repository.logOut();
      // assert
      expect(result, equals(Left(CacheFailure())));
    });
  });
}
