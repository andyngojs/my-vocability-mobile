import 'package:dio/dio.dart';
import 'package:my_vocability/core/network/api_base.dart';

class ApiHandler {
  final dio = Dio();
  final baseUrl = ApiBase().apiBaseUrl;

  Future<Response> get(String endpoint) async {
    final response = await dio.get('$baseUrl/$endpoint');

    return response;
  }

  Future<Response> post(String endpoint, dynamic data) async {
    final response = await dio.post('$baseUrl/$endpoint', data: data);
    return response;
  }
}
