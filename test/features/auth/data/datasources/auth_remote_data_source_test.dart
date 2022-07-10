import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/error/exceptions.dart';
import 'package:movies_app_leal/features/auth/data/datasources/auth_remote_data_source.dart';

void main() {
  late AuthRemoteDataSourceImpl dataSource;

  setUp(() {
    dataSource = AuthRemoteDataSourceImpl();
  });

  group("logInWithNameAndPassword", () {
    test('should login successfully using correct user information', () async {
      // act
      final result = await dataSource.logInWithNameAndPassword(defaultListAuthData[0]);
      // assert
      expect(result, defaultListAuthData[0]);
    });

    test('should throw a ServerException when send wrong information', () async {
      // act
      final call = dataSource.logInWithNameAndPassword;
      // assert
      expect(() => call(testAuthUserModel), throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
