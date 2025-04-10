import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@JsonSerializable(createToJson: false)
class NoteModel extends Equatable {
  const NoteModel({this.id});

  final String? id;

  factory NoteModel.fromJson(Map<String, dynamic> json) =>
      _$NoteModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
