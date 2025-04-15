import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/models/attachment_model.dart';

part 'note_model.g.dart';

@JsonSerializable(createToJson: false)
class NoteModel extends Equatable {
  const NoteModel({
    this.id,
    this.title,
    this.description,
    this.attachments = const [],
    this.createdAt,
  });

  final String? id;
  final String? title;
  final String? description;
  final List<AttachmentModel> attachments;
  final DateTime? createdAt;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  @override
  List<Object?> get props => [id];
}


