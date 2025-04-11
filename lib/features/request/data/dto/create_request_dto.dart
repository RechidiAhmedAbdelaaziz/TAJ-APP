part of 'request_dto.dart';

class CreateRequestDto extends RequestDto {
  CreateRequestDto()
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
