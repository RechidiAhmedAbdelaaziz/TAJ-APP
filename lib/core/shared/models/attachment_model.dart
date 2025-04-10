import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';

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

  MediaDTO get mediaDto {
    switch (type) {
      case 'image':
        return RemoteImageDTO(url!);
      case 'video':
        return RemoteVideoDTO(url!);
      default:
        throw Exception('Unsupported media type: $type');
    }
  }
}
