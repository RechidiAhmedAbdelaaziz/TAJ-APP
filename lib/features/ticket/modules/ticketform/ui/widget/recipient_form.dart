part of '../ticket_form_screen.dart';

class _RecipientForm extends StatelessWidget {
  const _RecipientForm();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<TicketFormCubit>().dto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppInputField(
          controller: dto.recipientNameController,
          hintText: 'Full Name'.tr(context),
          validator:
              (value) =>
                  value.isEmptyOrNull
                      ? 'Recipient name is required'.tr(context)
                      : null,
        ),
        heightSpace(16),

        AppInputField(
          controller: dto.recipientContactController,
          hintText: 'Phone Number'.tr(context),
          validator:
              (value) =>
                  value.isEmptyOrNull
                      ? 'Recipient phone number is required'.tr(context)
                      : null,
        ),
        heightSpace(16),

        AppSelectorField(
          label: 'Gender'.tr(context),
          controller: dto.recipientGenderController,
          items: (_) => ['Male', 'Female'],
          builder:
              (_, checkBox, item) => Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 8.w,
                children: [
                  checkBox,
                  Text(
                    item.tr(context),
                    style: AppTextStyles.medium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
        ),
      ],
    );
  }
}

