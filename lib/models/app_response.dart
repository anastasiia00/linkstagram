// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppResponse<T> {
  final bool success;
  final T? data;
  final dynamic errors;

  AppResponse({
    required this.success,
    this.data,
    this.errors,
  });

  @override
  String toString() =>
      'AppResponse(success: $success, data: $data, errors: $errors)';
}
