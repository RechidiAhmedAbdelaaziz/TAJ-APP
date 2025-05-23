// ignore_for_file: library_private_types_in_public_api

import 'package:json_annotation/json_annotation.dart';

part 'tokens.model.dart';
part 'pagination.model.dart';

part 'api_response.model.g.dart';

const _resultKey = 'result';

abstract class ApiResponseModel {
  final bool? success;

  ApiResponseModel({String? success})
    : success = success == 'success';
}

@JsonSerializable(createToJson: false)
class MessageResponse extends ApiResponseModel {
  final String? message;

  MessageResponse({super.success, this.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json[_resultKey] ?? {});
}

@JsonSerializable(createToJson: false)
class DataApiResponse extends ApiResponseModel {
  final Map<String, dynamic>? data;

  DataApiResponse({super.success, this.data});

  factory DataApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DataApiResponseFromJson(json[_resultKey] ?? {});
}

@JsonSerializable(createToJson: false)
class MultiDataApiResponse extends ApiResponseModel {
  final List<Map<String, dynamic>>? data;
  final Pagination? pagination;

  MultiDataApiResponse({
    super.success,
    this.data = const [],
    this.pagination,
  });

  factory MultiDataApiResponse.fromJson(Map<String, dynamic> json) =>
      _$PaginatedDataResponseFromJson(json);
}
