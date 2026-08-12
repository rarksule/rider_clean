import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:rider_clean/core/constants/constants.dart';
import 'package:rider_clean/core/error/exceptions.dart';
import '../constants/common.dart';
import '../constants/enums.dart';
import 'api_classes.dart';

class ApiRequestHandler {
  ApiRequestHandler._();
  static Future<ApiResponse> request(
    Uri url, {
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    int timeoutSeconds = 20,
  }) async {
    // if (!true) {
    //   //isNetworkAvailable()) {
    //   throw 'Your internet is not working';
    // }

    headers ??= {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: await SecureStorage.getStringAsync(
        apiKeyKey,
      ),
      HttpHeaders.cookieHeader:
          "accessToken:${await SecureStorage.getStringAsync(accessTokenKey)};",
      HttpHeaders.acceptHeader: 'application/json',
    };
    body ??= {};

    try {
      log('Request: $method $url\nHeaders: $headers\nBody: $body');

      late http.Response response;

      switch (method) {
        case HttpMethod.post:
          response = await http
              .post(url, headers: headers, body: jsonEncode(body))
              .timeout(
                Duration(seconds: timeoutSeconds),
                onTimeout: () => throw 'Timeout',
              );
          break;
        case HttpMethod.patch:
          response = await http
              .patch(url, headers: headers, body: jsonEncode(body))
              .timeout(
                Duration(seconds: timeoutSeconds),
                onTimeout: () => throw 'Timeout',
              );
          break;
        case HttpMethod.delete:
          response = await http
              .delete(url, headers: headers)
              .timeout(
                Duration(seconds: timeoutSeconds),
                onTimeout: () => throw 'Timeout',
              );
          break;
        default: // GET
          response = await http
              .get(url, headers: headers)
              .timeout(
                Duration(seconds: timeoutSeconds),
                onTimeout: () => throw 'Timeout',
              );
      }

      log('Response ($method): ${response.statusCode}\n\n${response.body}\n\n');

      return _handleResponse(response);
    } catch (e) {
      log("error log \n\n\n\n $e");
      rethrow;
    }
  }

  static Future<ApiResponse> requestMultipart(
    Uri url, {
    HttpMethod method = HttpMethod.get,
    Map<String, dynamic>? body,
    Map<String, File>? files,
    Map<String, String>? headers,
    int timeoutSeconds = 20,
  }) async {
    MultipartRequest multiPartRequest = MultipartRequest(
      method.toString().replaceFirst("HttpMethod.", "").toUpperCase(),
      url,
    );
    if (body != null) {
      body.forEach(
        (key, value) => multiPartRequest.fields[key] = value.toString(),
      );
    }
    if (files != null) {
      files.forEach(
        (key, value) async => multiPartRequest.files.add(
          await MultipartFile.fromPath(key, value.path),
        ),
      );
    }
    try {
      final stramedResponse = await multiPartRequest.send().timeout(
        Duration(seconds: timeoutSeconds),
        onTimeout: () => throw 'Timeout',
      );
      http.Response response = await http.Response.fromStream(stramedResponse);
      return _handleResponse(response);
    } catch (e) {
      rethrow;
    }
  }

  /// Private response handler
  static ApiResponse _handleResponse(http.Response response) {
    if (response.statusCode == 401) {
      throw UnauthorizedException('session invalid or expired');
    }

    if (response.statusCode >= 200 && response.statusCode <= 206) {
      try {
        final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
        return ApiResponse.success(
          jsonData["message"] ?? 'operation successful',
          jsonData,
        );
      } catch (e) {
        log('JSON parse error: $e');
        throw JsonException('Json Parse Error');
      }
    } else {
      try {
        final body = jsonDecode(response.body);

        final String message = body['message'] ?? 'response Parse Error';
        return ApiResponse.error(message);
      } catch (e) {
        log('Response error parsing failed: $e');
        rethrow;
      }
    }
  }
}
