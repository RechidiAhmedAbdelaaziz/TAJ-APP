part of '../ticket_form_screen.dart';

class _RecipientForm extends StatelessWidget {
  const _RecipientForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dto = context.read<TicketFormCubit>().dto;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppInputField(
          controller: dto.recipientNameController,
          hintText: 'Full Name',
          validator:
              (value) =>
                  value.isEmptyOrNull
                      ? 'Recipient name is required'
                      : null,
        ),
        heightSpace(16),

        AppInputField(
          controller: dto.recipientContactController,
          hintText: 'Phone Number',
          validator:
              (value) =>
                  value.isEmptyOrNull
                      ? 'Recipient phone number is required'
                      : null,
        ),
        heightSpace(16),

        AppSelectorField(
          label: 'Gender',
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
                    item,
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
