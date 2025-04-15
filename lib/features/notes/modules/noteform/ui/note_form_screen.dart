import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/shared/widgets/media_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notes/modules/noteform/logic/note_form_cubit.dart';

part 'widget/note_form.dart';

class NoteFormScreen extends StatelessWidget {
  const NoteFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select<NoteFormCubit, bool>(
      (cubit) => cubit.isLoading || !cubit.isLoaded,
    );

    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: const Text('Send a Note'),
      ),

      body: BlocListener<NoteFormCubit, NoteFormState>(
        listener: (context, state) {
          state.onSave((note) {
            context.back(note);
            context.showSuccessDialog(
              'The note has been sent successfully',
            );
          });

          state.onError(context.showErrorSnackbar);
        },
        child: ConditionalBuilder(
          condition: !isLoading,
          builder: (_) => _Form(),
          fallback: (_) => AppLoadignIndicator(),
        ),
      ),

      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 24.w,
          vertical: 24.h,
        ),
        decoration: BoxDecoration(
          color: Color(0x999F9F9F),
          boxShadow: [
            BoxShadow(
              color: const Color(0x40000000),
              blurRadius: 10.r,
            ),
          ],
        ),
        child: AppButton(
          text: 'Send Note',
          textStyle: AppTextStyles.normal.copyWith(
            color: AppColors.white,
          ),
          color: AppColors.buttonColor,

          isLoading:
              (ctx) => ctx.select(
                (NoteFormCubit cubit) => cubit.isLoading,
              ),
          onPressed: context.read<NoteFormCubit>().save,
        ),
      ),
    );
  }
}
