/// Generate an image URL to get images.
///
/// Passing the image path of the API
/// [imagePath] needs to have the prefix '/'
String setImagePathIntoUrl(String imagePath, {ImageSize imageSize = ImageSize.w500}) {
  final baseImageURl =
      "https://image.tmdb.org/t/p/${imageSize.name}"; // TODO: Add variable to .env file
  return "$baseImageURl$imagePath";
}

/// Enum with images sizes gave by the API.
enum ImageSize {
  w100,
  w200,
  w300,
  w400,
  w500,
  original,
}
