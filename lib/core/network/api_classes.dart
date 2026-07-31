import 'package:nb_utils/nb_utils.dart';

class ApiConfig {
  ApiConfig._();
  static const nodeServer = 'http://172.20.76.174:3000/api/v1';
  static const phpServer = 'http://172.20.76.174:1000/api/v1';
}

class ApiUrl {
  final String remoteBase;
  ApiUrl({required this.remoteBase});

  static const String ip = String.fromEnvironment('ip');

  String get baseUrl => ip.isEmpty ? remoteBase : ip;

  Uri getUri(
    String path, {
    String? pathSegments,
    Map<String, dynamic> queryParameters = const {},
  }) {
    log("\n\nip is $ip\n\n");
    final uri = Uri.parse(
      "$baseUrl/$path${pathSegments != null ? '/$pathSegments' : ''}",
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
