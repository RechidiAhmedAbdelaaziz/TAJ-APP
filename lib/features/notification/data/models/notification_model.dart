import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(createToJson: false)
class NotificationModel extends Equatable {
  final String? id;
  final DateTime? date;
  final String? title;
  final String? body;
  final String? imageUrl;

  const NotificationModel({
    this.id,
    this.date,
    this.title,
    this.body,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id];

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
}
