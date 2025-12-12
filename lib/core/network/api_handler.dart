import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_vocability/core/network/api_exception.dart';

class ApiHandler {
  final Dio _dio;
  final String _baseUrl;

  ApiHandler._(this._dio, this._baseUrl);

  factory ApiHandler({required String baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 15000),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );
    }

    return ApiHandler._(dio, baseUrl);
  }

  Future<dynamic> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  Future<dynamic> post(String endpoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response.data;
    } on DioException catch (e) {
      _handleDioError(e);
    } catch (e) {
      throw ApiException(message: 'An unexpected error occurred: $e');
    }
  }

  /// Centralized Dio error handling
  Never _handleDioError(DioException e) {
    // The request was made and the server responded with a status code
    // that falls out of the range of 2xx
    if (e.response != null) {
      throw ApiException(
        message: e.response?.data?['message'] ?? 'Server error occurred',
        statusCode: e.response?.statusCode,
        response: e.response,
      );
    } else {
      // Something happened in setting up or sending the request that triggered an Error
      // like connection timeout, no internet, etc.
      throw ApiException(message: 'Network error: ${e.message}');
    }
  }
}
