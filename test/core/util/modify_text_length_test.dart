import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app_leal/core/util/modify_text_length.dart';

void main() {
  const testMaxLength = 10;

  group("subStringTextLength", () {
    test('should return the same text when the text is smaller than max length', () async {
      // arrange
      const testText = "Hello test"; // 10 characters
      // act
      final response = subStringTextLength(testMaxLength, testText);
      // assert
      expect(response, testText);
    });

    test('should return a substringText when the text is bigger than max length', () async {
      // arrange
      const testText = "Hello test two"; // 14 characters
      const testEllipsis = "..."; // 3 characters
      // act
      final response = subStringTextLength(testMaxLength, testText, ellipsis: testEllipsis);
      // assert
      final expectedText =
          "${testText.substring(0, testMaxLength - testEllipsis.length)}$testEllipsis";
      expect(response, expectedText);
    });
  });
}
