import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rating_model.g.dart';

@JsonSerializable(createToJson: false)
class RatingModel extends Equatable {
  final String? id;
  final String? feedback;
  final int? rating;

  const RatingModel({this.feedback, this.rating, this.id});

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);

  @override
  List<Object?> get props => [id];
}
