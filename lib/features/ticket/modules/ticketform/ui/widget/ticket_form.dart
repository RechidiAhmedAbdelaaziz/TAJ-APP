part of '../ticket_form_screen.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<TicketFormCubit>().dto;
    return Form(
      key: dto.formKey,
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
                hintText: 'What do you need help with?'.tr(context),
                label: 'Title'.tr(context),
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Title is required'.tr(context)
                            : null,
              ),
              heightSpace(16),

              AppInputField(
                controller: dto.descriptionController,
                hintText: 'Description'.tr(context),
                label: 'Description'.tr(context),
                maxLines: 5,
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Description is required'.tr(context)
                            : null,
              ),
              heightSpace(16),

              AppDropDownField(
                controller: dto.maintenanceController,
                label: 'Maintenance Classification'.tr(context),
                itemsBuilder:
                    (_) =>
                        [
                          1,
                          2,
                          3,
                          4,
                          5,
                        ].map((e) => e.toString()).toList(),
                itemToString:
                    (value) => [
                      'Electrical',
                      'Plumbing',
                      'Carpentry',
                      'Painting',
                      'Cleaning',
                    ][int.parse(value) - 1].tr(context),
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Maintenance classification is required'
                                .tr(context)
                            : null,
              ),
              heightSpace(16),

              AppDropDownField(
                controller: dto.urgencyController,
                label: 'Urgency'.tr(context),
                itemsBuilder:
                    (_) =>
                        [
                          1,
                          2,
                          3,
                          4,
                        ].map((e) => e.toString()).toList(),
                itemToString:
                    (value) => [
                      'Minor',
                      'Moderate',
                      'Major',
                      'Critical',
                    ][int.parse(value) - 1].tr(context),
                validator:
                    (value) =>
                        value.isEmptyOrNull
                            ? 'Priority is required'.tr(context)
                            : null,
              ),
              heightSpace(16),

              AppDateField(
                controller: dto.appointmentDateController,
                label: 'Preferred Appointment'.tr(context),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
              ),
              heightSpace(16),

              AppSelectorField(
                controller: dto.recipientController,
                label: 'Service Recipient'.tr(context),
                items: (_) => ['Owner', 'Representative'],
                builder:
                    (_, checkBox, item) => Row(
                      spacing: 8.w,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        checkBox,
                        Text(
                          item.tr(context),
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
                label: 'Terms and conditions'.tr(context),
                validator:
                    (value) =>
                        value == false
                            ? 'You must accept the terms and conditions'
                                .tr(context)
                            : null,
              ),
              heightSpace(32),

              //add keyboard space
              SizedBox(
                height: MediaQuery.of(context).viewInsets.bottom,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
