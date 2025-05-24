import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponse extends ApiResponseModel {
  final _AuthResponseData? data;

  AuthResponse({super.status, this.data});

  UserModel get user => UserModel(
    id: data?.userId,
    name: data?.name,
    imageUrl: data?.imageUrl,
  );

  String get apiToken => data?.apiToken ?? '';

  factory AuthResponse.fromJson(Map<String, dynamic>? json) =>
      _$AuthResponseFromJson(json ?? {});
}

@JsonSerializable(createToJson: false)
class _AuthResponseData {
  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'api_token')
  final String? apiToken;

  final String? name;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  _AuthResponseData({
    this.userId,
    this.apiToken,
    this.name,
    this.imageUrl,
  });

  factory _AuthResponseData.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDataFromJson(json);
}
