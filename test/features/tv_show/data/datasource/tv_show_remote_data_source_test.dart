import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import '../../../../fixtures/fixture.dart';
import '../../../../fixtures/tests_values.dart';
import 'package:movies_app_leal/core/util/url_path_converter.dart';
import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockUrlPathConverter extends Mock implements UrlPathConverter {}

void main() {
  late TvShowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;
  late MockUrlPathConverter mockUrlPathConverter;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockUrlPathConverter = MockUrlPathConverter();
    dataSource =
        TvShowRemoteDataSourceImpl(client: mockHttpClient, urlPathConverter: mockUrlPathConverter);
  });

  group("getAiringTodayTvShows", () {
    test("Should perfom a GET request on a URL with application/json header", () async {
      //  arrange
      when(() => mockUrlPathConverter.convertDataToUriPath("airing_today")).thenReturn(testUri);
      when(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      ).thenAnswer(
          (_) async => Future.value(http.Response(fixture("tv_show_airing_today.json"), 200)));
      // act
      await dataSource.getAiringTodayTvShows();
      // assert
      verify(
        () => mockHttpClient.get(
          testUri,
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  });
}
