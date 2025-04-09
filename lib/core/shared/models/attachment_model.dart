import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attachment_model.g.dart';

@JsonSerializable(createToJson: false)
class AttachmentModel extends Equatable {
  final String? url;
  final String? type;

  const AttachmentModel({this.url, this.type});

  factory AttachmentModel.fromJson(Map<String, dynamic> json) =>
      _$AttachmentModelFromJson(json);

  @override
  List<Object?> get props => [url, type];

  // TODO : convert attachment to MediaDTO
}
