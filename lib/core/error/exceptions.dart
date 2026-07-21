/// Exceptions are what the DATA layer throws (from remote/local data sources).
/// The repository implementation catches these and converts them to Failures.
class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error']);
}

class JsonException implements Exception {
  final String message;
  JsonException([this.message = 'Cache error']);
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'Unauthorized']);
}

class ProcessException implements Exception {
  final String message;
  ProcessException([this.message = 'Unauthorized']);
}