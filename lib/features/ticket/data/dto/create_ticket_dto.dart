part of 'ticket_dto.dart';

class CreateTicketDto extends TicketDto {
  CreateTicketDto()
    : super(
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
        maintenanceController: EditingController<String>(
          '1',
        ),
        urgencyController: EditingController<String>('1'),
        appointmentDateController: EditingController<DateTime>(),
        recipientController: EditingController<String>('Owner'),
        recipientNameController: TextEditingController(),
        recipientContactController: TextEditingController(),
        recipientGenderController: EditingController<String>('Male'),
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
          appointmentDateController.value?.toSqlDateTime(),
      'attachments': await Future.wait(
        attachmentsController.value.map(
          (e) async => {
            // base64
            "media": await e.url,
            'type': e.type,
          },
        ),
      ),
    }.withoutNullsOrEmpty();
  }
}
