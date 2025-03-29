import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable(createToJson: false)
class BannerModel extends Equatable {
  final String? id;
  final String? imageUrl;

  const BannerModel({this.id, this.imageUrl});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @override
  List<Object?> get props => [id, imageUrl];
}
