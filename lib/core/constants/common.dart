import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nb_utils/nb_utils.dart';

class Common {
  Common._();

  static InputDecoration inputDecoration({
    String? label,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixIcon: prefixIcon,
      labelText: label ?? '', //"Sample Text",
      suffixIcon: suffixIcon,
    );
  }
}

class SecureStorage {
  SecureStorage._();

  static const storage = FlutterSecureStorage();

  /// Returns a StringList if exists in SharedPref
  static Future<List<String>?> getStringListAsync(String key) async {
    return  (await storage.read(key: key))?.split(",").toList();
    // Make a copy of the list so that later mutations won't propagate
  }

  /// Returns a Bool if exists in SharedPref
  static Future<bool> getBoolAsync(
    String key, {
    bool defaultValue = false,
  }) async {
    bool? val = bool.tryParse((await storage.read(key: key)).validate());
    return val ?? defaultValue;
  }

  /// Returns a Double if exists in SharedPref
  static Future<double> getDoubleAsync(
    String key, {
    double defaultValue = 0.0,
  }) async {
    double? val = double.tryParse((await storage.read(key: key)).validate());
    return val ?? defaultValue;
  }

  /// Returns a Int if exists in SharedPref
  static Future<int> getIntAsync(String key, {int defaultValue = 0}) async {
    int? val = int.tryParse((await storage.read(key: key)).validate());
    return val ?? defaultValue;
  }

  /// Returns a String if exists in SharedPref
  static Future<String> getStringAsync(
    String key, {
    String defaultValue = '',
  }) async {
    return await storage.read(key: key) ?? defaultValue;
  }

  /// Returns a JSON if exists in SharedPref
  static Future<Map<String, dynamic>> getJSONAsync(
    String key, {
    Map<String, dynamic>? defaultValue,
  }) async {
    if (await storage.containsKey(key: key) &&
        (await storage.read(key: key)).validate().isNotEmpty) {
      return jsonDecode((await storage.read(key: key))!);
    }
    return defaultValue ?? {};
  }

  /// remove key from SharedPref
  static Future<void> removeKey(String key) async {
    return await storage.delete(key: key);
  }

  static Future<void> setValue(String key, dynamic value, {bool print = true}) async {
  if (value == null) {
    if (print) log('$key - value is null');
    return Future.value();
  }
  if (print) log('${value.runtimeType} - $key - $value');

  if (value is String) {
    return await storage.write(key:key, value:value);
  } else if (value is int) {
    return await storage.write(key:key, value:value.toString());
  } else if (value is bool) {
    return await storage.write(key:key, value:value.toString());
  } else if (value is double) {
    return await storage.write(key:key, value:value.toString());
  } else if (value is Map<String, dynamic>) {
    return await storage.write(key:key, value:jsonEncode(value));
  } else if (value is List<String>) {
    return await storage.write(key:key, value:value.join(","));
  } else {
    throw ArgumentError(
      'Invalid value ${value.runtimeType} - Must be a String, int, bool, double, Map<String, dynamic> or StringList',
    );
  }
}
}
