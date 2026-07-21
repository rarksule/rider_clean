class ApiConfig {
  ApiConfig._();
  static const nodePrdServer = 'http://10.102.199.86:3000/api/v2';
  static const nodeTstServer = 'http://10.0.2.2:3000/api/v2';
  static const phpProdServer = 'http://10.102.199.86:1000/api/v1';
  static const phpTestServer = 'http://10.0.2.2:1000/api/v1';
}

class ApiUrl {
  final String localBase;
  final String remoteBase;
  ApiUrl({required this.localBase, required this.remoteBase});

  static const bool useLocal = bool.fromEnvironment(
    'USE_LOCAL',
    defaultValue: false,
  );

  String get baseUrl => useLocal ? localBase : remoteBase;


  Uri getUri(
    String path, {
    String? pathSegments,
    Map<String, dynamic> queryParameters = const {},
  }) {
    final uri = Uri.parse(
      "$baseUrl/$path${pathSegments != null ? '/$pathSegments' : ''}",
    );

    return uri.replace(
      queryParameters: queryParameters.isEmpty ? null : queryParameters,
    );
  }
}

abstract class ApiResult<T> {
  final Map<String ,dynamic>? data;
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

  factory ApiResponse.success(String message, Map<String ,dynamic> data) =>
      ApiResponse._(data: data, message: message, isSuccess: true);
  factory ApiResponse.error(String message) =>
      ApiResponse._(message: message, isSuccess: false);
}


