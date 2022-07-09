import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'package:movies_app_leal/features/tv_show/data/datasources/tv_show_remote_data_source.dart';

import '../../../../fixtures/fixture.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late TvShowRemoteDataSourceImpl dataSource;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = TvShowRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("getAiringTodayTvShows", () {
    const String testUrlParam = "airing_today";

    test('''Should perfom a GET request on a URL with number
    beign the endpoint with application/json header''', () async {
      //  arrange
      when(() => mockHttpClient.get(
              Uri.https(
                baseUrl,
                testUrlParam,
                baseQueryParams,
              ),
              headers: {"Content-Type": "application/json"}))
          .thenAnswer((_) async => http.Response(fixture("tv_show_airing_today.json"), 200));
      // act
      dataSource.getAiringTodayTvShows();
      // assert
      verify(
        () => mockHttpClient.get(
          Uri.https(baseUrl, testUrlParam, baseQueryParams),
          headers: {"Content-Type": "application/json"},
        ),
      );
    });
  });
}
