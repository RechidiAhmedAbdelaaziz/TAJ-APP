import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'real_state_model.g.dart';

@JsonSerializable(createToJson: false)
class RealStateModel extends Equatable {
  final String? id;
  final String? name;
  final String? address;
  final String? type;
  final int? area;
  final DateTime? purshaseDate;
  final DateTime? warrantyDate;
  final int? constructionYear;

  final String? plansFileUrl;
  final String? profileFileUrl;
  final List<String> imagesUrls;

  // Added fileds related to user
  final DateTime? warrantyEndDate;
  bool? get waarrantyIsActive =>
      warrantyEndDate != null
          ? DateTime.now().isBefore(warrantyEndDate!)
          : null;
  final int? ticketsLeft;

  const RealStateModel({
    this.id,
    this.name,
    this.address,
    this.type,
    this.purshaseDate,
    this.warrantyDate,
    this.constructionYear,
    this.plansFileUrl,
    this.profileFileUrl,
    this.area,
    this.imagesUrls = const [],
    this.warrantyEndDate,
    this.ticketsLeft,
  });

  @override
  List<Object?> get props => [id];

  factory RealStateModel.fromJson(Map<String, dynamic> json) =>
      _$RealStateModelFromJson(json);
}
