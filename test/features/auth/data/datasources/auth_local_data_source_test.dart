import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture.dart';
import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_local_data_source.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late AuthLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group("logOut", () {
    test('should consult into cache for Auth data when user want to logOut', () async {
      // arrange
      when(() => mockSharedPreferences.getString(authCachedKey)).thenReturn(fixture("auth.json"));
      // act
      await dataSource.logOut();
      // assert
      verify(() => mockSharedPreferences.getString(authCachedKey));
    });

    test('should throw a CacheException when there is no AuthData when user want to logOut',
        () async {
      // arrange
      when(() => mockSharedPreferences.getString(authCachedKey)).thenReturn(null);
      // act
      final call = dataSource.logOut;
      // assert
      expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
    });
  });

  group("cacheAuthData", () {
    test('Should call SharedPreferences to cache the data', () async {
      // arrange
      final expectedJsonString = json.encode(testAuthUserModel.toJson());
      when(() => mockSharedPreferences.setString(authCachedKey, expectedJsonString))
          .thenAnswer((_) async => true);
      // act
      dataSource.cacheAuthData(testAuthUserModel);
      // assert
      verify(() => mockSharedPreferences.setString(authCachedKey, expectedJsonString));
    });
  });
}
