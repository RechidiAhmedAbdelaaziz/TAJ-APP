class ApiErrorModel {
  final bool? success;
  final String message;

  const ApiErrorModel({
    String? status,
    this.message = 'Oops! Something went wrong',
  }) : success = status == 'success';

  factory ApiErrorModel.fromJson(Map<String, dynamic>? json) {
    return ApiErrorModel(
      status: json?['status'],
      message: json?['message'],
    );
  }
}
