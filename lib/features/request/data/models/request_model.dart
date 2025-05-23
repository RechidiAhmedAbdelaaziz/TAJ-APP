import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/models/attachment_model.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';

part 'request_model.g.dart';

@JsonSerializable(createToJson: false)
class RequestModel extends Equatable {
  final int? id;
  final RealStateModel? realState;

  final String? name;
  final String? description;

  @JsonKey(name: 'maintenance_classification')
  final String? maintenanceClassification;

  final String? type;

  @JsonKey(name: 'urgency_level')
  final String? urgency;

  final String? stage;
  @JsonKey(name: 'create_date')
  final DateTime? createdAt;

  @JsonKey(name: 'preferred_appointment')
  final DateTime? appointmentDate;

  @JsonKey(name: 'qr_code')
  final String? qrCodeUrl;

  bool get needConfirmation => stage == 'Waiting for confirmation';
  Color get statusColor {
    switch (stage) {
      case 'Completed':
        return Colors.green;
      case 'Rejected':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  final List<AttachmentModel> attachments;

  const RequestModel({
    this.id,
    this.realState,
    this.name,
    this.description,
    this.maintenanceClassification,
    this.type,
    this.urgency,
    this.stage,
    this.createdAt,
    this.appointmentDate,
    String? qrCodeUrl,
    this.attachments = const [],
  }) : qrCodeUrl = stage == 'Open' ? qrCodeUrl : null;

  factory RequestModel.fromJson(Map<String, dynamic> json) =>
      _$RequestModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
