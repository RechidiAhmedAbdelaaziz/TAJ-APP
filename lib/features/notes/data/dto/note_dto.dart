import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';

abstract class NoteDto extends FormDTO {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final ListEditingController<MediaDTO> mediaController;

  NoteDto({
    required this.titleController,
    required this.descriptionController,
    required this.mediaController,
  });

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    mediaController.dispose();
  }
}

class CreateNoteDto extends NoteDto {
  CreateNoteDto()
    : super(
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
        mediaController: ListEditingController(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'title': titleController.text,
      'description': descriptionController.text,
      'media': await mediaController.value.urls,
    };
  }
}
