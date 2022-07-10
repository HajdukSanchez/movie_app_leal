/// Throws a new expection when there is an error with the server or the response.
class ServerException implements Exception {}

/// Throws a new expection when there is an error parsing HTTP.
class HttpException implements Exception {}

/// Thorws a new exception when there is an error getting data from cache.
class CacheException implements Exception {}
