import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/models/attachment_model.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';

part 'request_model.g.dart';

@JsonSerializable(createToJson: false)
class RequestModel extends Equatable {
  final String? id;
  final RealStateModel? realState;

  final String? title;
  final String? description;
  final String? maintenanceClassification;
  final String? type;
  final String? urgency;

  final String? status;
  final DateTime? createdAt;
  final DateTime? appointmentDate;

  final List<AttachmentModel> attachments;

  const RequestModel({
    this.id,
    this.realState,
    this.title,
    this.description,
    this.maintenanceClassification,
    this.type,
    this.urgency,
    this.status,
    this.createdAt,
    this.appointmentDate,
    this.attachments = const [],
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
