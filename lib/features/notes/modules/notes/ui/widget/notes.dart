part of '../notes_screen.dart';

class _Notes extends StatelessWidget {
  const _Notes();

  @override
  Widget build(BuildContext context) {
    final notes = context.select((NotesCubit cubit) => cubit.notes);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: ListView.separated(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return _Note(note);
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}

class _Note extends StatelessWidget {
  final NoteModel note;

  const _Note(this.note);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0x40000000), blurRadius: 12.r),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDate(note.createdAt),
              heightSpace(20),

              _buildInfo('Note No:', note.id),
              heightSpace(8),
              _buildInfo('Title:', note.title),
              heightSpace(32),

              AppButton(
                text: 'Details',
                textStyle: AppTextStyles.normal.copyWith(
                  color: AppColors.black,
                ),
                color: AppColors.buttonColor,

                onPressed:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotesDetails(note),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDate(DateTime? date) {
    if (date == null) return const SizedBox();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date.toDayMonthYear(),
          style: AppTextStyles.medium.copyWith(color: AppColors.grey),
        ),
        Text(
          date.toHourMinute(),
          style: AppTextStyles.medium.copyWith(color: AppColors.grey),
        ),
      ],
    );
  }

  Widget _buildInfo(String title, String? value) {
    return Text(
      '$title $value',
      style: AppTextStyles.normal.copyWith(color: AppColors.black),
    );
  }
}
