

class ApiUrl {
  final String remoteBase;
  ApiUrl({required this.remoteBase});

  Uri getUri(
    String path, {
    String? pathSegments,
    Map<String, dynamic> queryParameters = const {},
  }) {
    final uri = Uri.parse(
      "$remoteBase/$path${pathSegments != null ? '/$pathSegments' : ''}",
    );

    return uri.replace(
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }
}

abstract class ApiResult<T> {
  final Map<String, dynamic>? data;
  final String message;
  final bool isSuccess;
  const ApiResult({
    required this.data,
    required this.message,
    required this.isSuccess,
  });
}

class ApiResponse<T> extends ApiResult<T> {
  ApiResponse._({required super.isSuccess, required super.message, super.data});

  factory ApiResponse.success(String message, Map<String, dynamic> data) =>
      ApiResponse._(data: data, message: message, isSuccess: true);
  factory ApiResponse.error(String message) =>
      ApiResponse._(message: message, isSuccess: false);
}
