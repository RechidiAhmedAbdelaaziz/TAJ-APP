import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'document_model.g.dart';

@JsonSerializable(createToJson: false)
class DocumentModel extends Equatable {
  final String? id;
  final String? type;
  final String? fileUrl;

  final String? docNumber;
  final String? requestNumber;

  const DocumentModel({
    this.id,
    this.type,
    this.fileUrl,
    this.docNumber,
    this.requestNumber,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
