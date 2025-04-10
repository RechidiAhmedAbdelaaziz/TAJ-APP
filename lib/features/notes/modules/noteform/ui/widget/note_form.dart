part of '../note_form_screen.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final dto = context.read<NoteFormCubit>().dto;
    return Form(
      key: dto.formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            AppInputField(
              controller: dto.titleController,
              label: 'Title',
              hintText: 'Enter the title of the note',
              validator:
                  (value) =>
                      value?.isEmpty == true
                          ? 'Title is required'
                          : null,
            ),
            heightSpace(12),

            AppInputField(
              controller: dto.descriptionController,
              label: 'Description',
              hintText: 'Enter the description of the note',
              maxLines: 5,
              validator:
                  (value) =>
                      value?.isEmpty == true
                          ? 'Description is required'
                          : null,
            ),
            heightSpace(24),

            MultiMediaField(
              controller: dto.mediaController,
              note: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Note: Attach Up To 5 Photos Or Videos',
                    style: AppTextStyles.normal.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  const Divider(height: 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
