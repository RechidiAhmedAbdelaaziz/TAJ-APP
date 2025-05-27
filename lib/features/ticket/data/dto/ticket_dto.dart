import 'package:flutter/widgets.dart';
import 'package:taj_elsafa/core/di/locator.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/map.extension.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/boolean_editigcontroller.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/classes/editioncontollers/list_generic_editingcontroller.dart';
import 'package:taj_elsafa/core/shared/dto/form_dto.dart';
import 'package:taj_elsafa/core/shared/dto/imagedto/image.dto.dart';
import 'package:taj_elsafa/features/auth/configs/auth_cache.dart';

part 'create_ticket_dto.dart';

abstract class TicketDto extends FormDTO {
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final EditingController<String> maintenanceController;
  final EditingController<String> urgencyController;
  final EditingController<DateTime> appointmentDateController;
  final EditingController<String> recipientController;

  // if recipient is not owner
  final TextEditingController recipientNameController;
  final TextEditingController recipientContactController;
  final EditingController<String> recipientGenderController;

  final ListEditingController<MediaDTO> attachmentsController;

  final BooleanEditingController termsController;

  TicketDto({
    required this.titleController,
    required this.descriptionController,
    required this.maintenanceController,
    required this.urgencyController,
    required this.appointmentDateController,
    required this.recipientController,
    required this.recipientNameController,
    required this.recipientContactController,
    required this.recipientGenderController,
    required this.attachmentsController,
    required this.termsController,
  });

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    maintenanceController.dispose();
    urgencyController.dispose();
    appointmentDateController.dispose();
    recipientController.dispose();
    recipientNameController.dispose();
    recipientContactController.dispose();
    recipientGenderController.dispose();
    attachmentsController.dispose();
    termsController.dispose();
  }
}
