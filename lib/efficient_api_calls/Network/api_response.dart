// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApiResponse<T> {
  T? data;
  String? statusCode;
  bool? success;
  String? statusMessage;

  ApiResponse({
    this.data,
    this.statusCode,
    this.success,
    this.statusMessage,
  });

  @override
  String toString() {
    return 'ApiResponse(data: $data, statusCode: $statusCode, success: $success, statusMessage: $statusMessage)';
  }

  factory ApiResponse.fromError(String message, String statusCode) {
    return ApiResponse(
      success: false,
      statusCode: statusCode,
      statusMessage: message,
    );
  }
}
