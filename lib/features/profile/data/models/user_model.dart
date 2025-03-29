import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends Equatable {
  final String? id;
  final String? name;
  final String? contactNumber;
  final String? altContactNumber;
  final String? email;
  final String? imageUrl;

  const UserModel({
    this.id,
    this.name,
    this.contactNumber,
    this.altContactNumber,
    this.email,
    this.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
