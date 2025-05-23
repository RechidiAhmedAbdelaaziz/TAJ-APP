// ignore_for_file: library_private_types_in_public_api

import 'package:json_annotation/json_annotation.dart';

part 'tokens.model.dart';
part 'pagination.model.dart';

part 'api_response.model.g.dart';

const _resultKey = 'result';

abstract class ApiResponseModel {
  final String? status;
  final String? message;

  ApiResponseModel({this.status, this.message});

  bool get success => status == 'success';
}

@JsonSerializable(createToJson: false)
class MessageResponse extends ApiResponseModel {
  MessageResponse({super.status, super.message});

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class DataApiResponse extends ApiResponseModel {
  final Map<String, dynamic>? data;

  DataApiResponse({super.status, this.data, super.message});

  factory DataApiResponse.fromJson(Map<String, dynamic> json) =>
      _$DataApiResponseFromJson(json[_resultKey] ?? {});
}
@JsonSerializable(createToJson: false)
class DataApiResponseWithoutResult extends ApiResponseModel {
  final Map<String, dynamic>? data;

  DataApiResponseWithoutResult({super.status, this.data, super.message});

  factory DataApiResponseWithoutResult.fromJson(Map<String, dynamic> json) =>
      _$DataApiResponseWithoutResultFromJson(json);
}


@JsonSerializable(createToJson: false)
class MultiDataApiResponse extends ApiResponseModel {
  final List<Map<String, dynamic>>? data;
  final Pagination? pagination;

  MultiDataApiResponse({
    super.status,
    this.data = const [],
    this.pagination,
  });

  factory MultiDataApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MultiDataApiResponseFromJson(json);
}
