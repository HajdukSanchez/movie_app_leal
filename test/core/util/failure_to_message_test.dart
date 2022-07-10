import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app_leal/core/error/failures.dart';
import 'package:movies_app_leal/core/error/messages.dart';
import 'package:movies_app_leal/core/util/failure_to_message.dart';

void main() {
  late Message message;

  setUp(() {
    message = Message();
  });

  group("mapFailureToMessage", () {
    test('should return a valid message when is a ServerFailure', () async {
      // act
      final response = message.mapFailureToMessage(ServerFailure());
      // assert
      expect(response, invalidDataFailureMessage);
    });

    test('should return a valid message when is a CacheFailure', () async {
      // act
      final response = message.mapFailureToMessage(CacheFailure());
      // assert
      expect(response, cachedFailureMessage);
    });
  });
}
