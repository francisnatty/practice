import 'api_response.dart';

abstract class ApiClient {
  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic json)? fromJsonT,
    bool? showLoader,
  });

  void setToken(String token);
  void removeToken();
  String handleException(Exception exception);
}

enum MethodType { get, post, put, delete, patch }
