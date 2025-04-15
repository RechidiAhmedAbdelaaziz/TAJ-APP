import 'package:flutter/material.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/number_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';

abstract class RatingDto extends FormDTO {
  final TextEditingController feedbackController;
  final IntEditingcontroller ratingController;

  RatingDto({
    required this.feedbackController,
    required this.ratingController,
  });

  @override
  void dispose() {
    feedbackController.dispose();
    ratingController.dispose();
  }
}

class CreateRatingDto extends RatingDto {
  CreateRatingDto()
    : super(
        feedbackController: TextEditingController(),
        ratingController: IntEditingcontroller(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'feedback': feedbackController.text,
      'rating': ratingController.value,
    };
  }
}
