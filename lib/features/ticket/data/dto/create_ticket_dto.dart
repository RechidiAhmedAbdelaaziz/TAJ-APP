part of 'ticket_dto.dart';

class CreateTicketDto extends TicketDto {
  CreateTicketDto()
    : super(
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
        maintenanceController: EditingController<String>(),
        urgencyController: EditingController<String>(),
        appointmentDateController: EditingController<DateTime>(),
        recipientController: EditingController<String>(),
        recipientNameController: TextEditingController(),
        recipientContactController: TextEditingController(),
        recipientGenderController: EditingController<String>(),
        attachmentsController: ListEditingController<MediaDTO>(),
        termsController: BooleanEditingController(),
      );

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      'user_id': locator<AuthCache>().user!.id!,
      'title': titleController.text,
      'description': descriptionController.text,
      'maintenance_classification_id': int.tryParse(
        maintenanceController.value ?? '',
      ),
      'urgency_level_id': int.tryParse(urgencyController.value ?? ''),
      'preferred_appointment_datetime':
          appointmentDateController.value?.toIso8601String(),
      'attachments': await Future.wait(
        attachmentsController.value.map(
          (e) async => {
            // base64
            "media": await e.url,
            'type': e.runtimeType,
          },
        ),
      ),
    }.withoutNullsOrEmpty();
  }
}
