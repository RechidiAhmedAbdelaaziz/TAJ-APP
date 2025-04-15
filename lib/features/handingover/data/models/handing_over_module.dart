import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/core/shared/models/attachment_model.dart';

part 'handing_over_module.g.dart';

@JsonSerializable(createToJson: false)
class HandingOverModel {
  const HandingOverModel({
    this.conditions = const [],
    this.isVerified = true,
    this.hasNotes = true,
    this.id,
  });

  final String? id;
  final bool isVerified;
  final bool hasNotes;
  final List<HandingOverConditions> conditions;

  factory HandingOverModel.fromJson(Map<String, dynamic> json) =>
      _$HandingOverModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class HandingOverConditions {
  final String? title;
  final List<String>? points;
  final ListEditingController<MediaDTO> medias;

  HandingOverConditions({
    this.title,
    this.points,
    List<AttachmentModel> attachments = const [],
  }) : medias = ListEditingController(
         attachments.map((e) => e.mediaDto).toList(),
       );

  factory HandingOverConditions.fromJson(Map<String, dynamic> json) =>
      _$HandingOverConditionsFromJson(json);
}
