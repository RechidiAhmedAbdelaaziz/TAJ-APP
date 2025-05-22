import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final String? mobile;
  final String? email;
  final String? imageUrl;

 const UserModel({
    this.id,
    this.name,
    this.phone,
    this.mobile,
    this.email,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id];
}
