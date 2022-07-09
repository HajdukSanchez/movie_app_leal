import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/util/url_path_converter.dart';

class MockUrlPathConverter extends Mock implements UrlPathConverter {}

void main() {
  late UrlPathConverter urlPathConverter;
  late MockUrlPathConverter mockUrlPathConverter;

  setUp(() {
    urlPathConverter = UrlPathConverter();
    mockUrlPathConverter = MockUrlPathConverter();
  });

  group("convertDataToUriPath", () {
    test('should return a correct URI passing a correct path', () async {
      // act
      final result = urlPathConverter.convertDataToUriPath(testPath);
      // assert
      expect(result, Uri.parse(testFullUrl));
    });

    test('should return a Failure when something wrong in Url Path', () async {
      // arrange
      when(() => mockUrlPathConverter.convertDataToUriPath(testPath))
          .thenThrow(InvalidUriFailure());
      // assert
      expect(() => mockUrlPathConverter.convertDataToUriPath(testPath),
          throwsA(isA<InvalidUriFailure>()));
    });
  });
}
