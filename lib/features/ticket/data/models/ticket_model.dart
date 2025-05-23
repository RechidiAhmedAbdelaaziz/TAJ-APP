import 'package:json_annotation/json_annotation.dart';
import 'package:taj_elsafa/core/shared/models/attachment_model.dart';
import 'package:taj_elsafa/features/realstates/data/models/real_state_model.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';

part 'ticket_model.g.dart';

@JsonSerializable(createToJson: false)
class TicketModel extends RequestModel {
  const TicketModel({
    super.id,
    super.realState,
    super.name,
    super.description,
    super.maintenanceClassification,
    super.type,
    super.urgency,
    super.stage,
    super.createdAt,
    super.appointmentDate,
    super.qrCodeUrl,
    super.attachments = const [],
  }) : super();

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
}
