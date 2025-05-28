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
          // vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightSpace(16),
              AppInputField(
                controller: dto.titleController,
                label: 'Title'.tr(context),
                hintText: 'Enter the title of the note'.tr(context),
                validator:
                    (value) =>
                        value?.isEmpty == true
                            ? 'Title is required'.tr(context)
                            : null,
              ),
              heightSpace(12),

              AppInputField(
                controller: dto.descriptionController,
                label: 'Description'.tr(context),
                hintText: 'Enter the description of the note'.tr(
                  context,
                ),
                maxLines: 5,
                validator:
                    (value) =>
                        value?.isEmpty == true
                            ? 'Description is required'.tr(context)
                            : null,
              ),
              heightSpace(24),

              MultiMediaField(
                controller: dto.mediaController,
                autoScroll: false,
                note: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note: Attach Up To 5 Photos Or Videos'.tr(
                        context,
                      ),
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
      ),
    );
  }
}
