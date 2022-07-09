import 'package:movies_app_leal/core/error/failures.dart';

/// Class to convert data into a URI path.
class UrlPathConverter {
  static const baseUrl = "api.themoviedb.org"; // TODO: add to a environment variables file
  static const basePath = "/3/tv"; // TODO: add to a add to a environment variables file
  static const baseQueryParams = {
    "api_key": "56da94afef2f8be1549d9cbe18339632",
    "language": "en-US",
    "page": "1",
  }; // TODO: add to a environment variables file

  /// Convert url path to a URI.
  ///
  /// Return a valida URI if we pass an [urlPath] to converted it with query params and base url data.
  /// Return a Failure of something wrong parsing the URI.
  Uri convertDataToUriPath(String urlPath) {
    try {
      final Uri uriResponse = Uri.https(baseUrl, "$basePath/$urlPath", baseQueryParams);
      return uriResponse;
    } catch (e) {
      throw InvalidUriFailure();
    }
  }
}

/// Class to handfle failure parsing data to an URI path
class InvalidUriFailure extends Failure {
  @override
  List<Object?> get props => [];
}
