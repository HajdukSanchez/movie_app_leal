import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';

void main() {
  test('should be a subclass of Entity TvShow', () async {
    // assert
    expect(testAuthUserModel, isA<Auth>());
  });

  group("toJson", () {
    test('Should return a JSON map containing the proper data', () async {
      // act
      final result = testAuthUserModel.toJson();
      // assert
      final expectedMap = {
        "name": "test",
        "password": "test",
      };
      expect(result, expectedMap);
    });
  });
}
