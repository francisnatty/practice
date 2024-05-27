import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:practice/efficient_api_calls/Network/api_client.dart';
import 'package:practice/efficient_api_calls/Network/api_response.dart';

class DioClient implements ApiClient {
  late Dio _client;
  DioClient() {
    _client = Dio()
      ..options.baseUrl = 'https://api.themoviedb.org/3/'
      ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        options.queryParameters['api-key'] = 'your-api-key';
        return handler.next(options);
      }));
  }
  @override
  String handleException(Exception exception) {
    // TODO: implement handleException
    throw UnimplementedError();
  }

  @override
  void removeToken() {
    _client.options.headers.remove('Authorization');
  }

  @override
  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic json)? fromJsonT,
    bool? showLoader,
  }) async {
    ApiResponse<T> apiResponse;
    Response response;
    try {
      switch (method) {
        case MethodType.get:
          response = await _client.get(
            path,
            data: payload,
            queryParameters: queryParameters,
          );

          break;
        case MethodType.post:
          response = await _client.post(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.put:
          response = await _client.put(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.delete:
          response = await _client.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.patch:
          response = await _client.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
      }
      apiResponse = ApiResponse(
        data: fromJsonT?.call(response.data),
        statusCode: response.statusCode.toString(),
        success: true,
      );
      return apiResponse;
    } on DioException catch (e) {
      apiResponse = ApiResponse<T>.fromError(
          e.response?.data['status_message'] ?? e.message.toString(),
          (e.response?.data['status_code'] ?? e.response?.statusCode)
              .toString());
    }
    log(apiResponse.toString(), name: 'api_response');
    return apiResponse;
  }

  @override
  void setToken(String token) {
    _client.options.headers.remove('Authorization');
  }
}
