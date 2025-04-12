part of '../ticket_form_screen.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<TicketFormCubit>().dto;
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppInputField(
                controller: dto.titleController,
                hintText: 'What do you need help with?',
                label: 'Title',
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Title is required'
                            : null,
              ),
              heightSpace(16),

              AppInputField(
                controller: dto.descriptionController,
                hintText: 'Description',
                label: 'Description',
                maxLines: 5,
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Description is required'
                            : null,
              ),
              heightSpace(16),

              AppDropDownField(
                controller: dto.maintenanceController,
                label: 'Maintenance Classification',
                itemsBuilder:
                    (_) => [
                      'Electrical',
                      'Plumbing',
                      'Carpentry',
                      'Painting',
                      'Cleaning',
                    ],
                itemToString: (value) => value,
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Maintenance classification is required'
                            : null,
              ),
              heightSpace(16),

              AppDropDownField(
                controller: dto.urgencyController,
                label: 'Urgency',
                itemsBuilder:
                    (_) => ['Minor', 'Moderate', 'Major', 'Critical'],
                itemToString: (value) => value,
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Priority is required'
                            : null,
              ),
              heightSpace(16),

              AppDateField(
                controller: dto.appointmentDateController,
                label: 'Preferred Appointment',
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
              ),
              heightSpace(16),

              AppSelectorField(
                controller: dto.recipientController,
                label: 'Service Recipient',
                items: (_) => ['Owner', 'Representative'],
                builder:
                    (_, checkBox, item) => Row(
                      spacing: 8.w,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        checkBox,
                        Text(
                          item,
                          style: AppTextStyles.normal.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
              ),
              heightSpace(16),

              ValueListenableBuilder(
                valueListenable: dto.recipientController,
                builder:
                    (_, value, __) =>
                        value == 'Owner'
                            ? SizedBox.shrink()
                            : _RecipientForm(),
              ),
              heightSpace(32),

              MultiMediaField(controller: dto.attachmentsController),
              heightSpace(32),

              AppCheckBoxField(
                controller: dto.termsController,
                label: 'Terms And Conditions',
                validator:
                    (value) =>
                        value == false
                            ? 'You must accept the terms and conditions'
                            : null,
              ),
              heightSpace(40),
            ],
          ),
        ),
      ),
    );
  }
}
