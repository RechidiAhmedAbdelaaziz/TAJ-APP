import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/network/models/api_response.model.dart';
import 'package:taj_elsafa/features/profile/data/models/user_model.dart';

part 'auth_response.g.dart';

@JsonSerializable(createToJson: false)
class AuthResponse extends ApiResponseModel {
  @JsonKey(name: 'user_id')
  final int? userId;

  @JsonKey(name: 'api_token')
  final String? apiToken;

  final String? name;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  AuthResponse({
    super.success,
    this.userId,
    this.apiToken,
    this.name,
    this.imageUrl,
  });

  UserModel get user => UserModel(
    id: userId,
    name: name,
    imageUrl: imageUrl,
  );

  factory AuthResponse.fromJson(Map<String, dynamic>? json) =>
      _$AuthResponseFromJson(json ?? {});
}
