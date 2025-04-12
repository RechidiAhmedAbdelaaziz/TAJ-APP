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
    return {};
  }
}
