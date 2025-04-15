import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/extension/snackbar.extension.dart';
import 'package:taj_elsafa/core/extension/validator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/check_box_field.dart';
import 'package:taj_elsafa/core/shared/widgets/date_field.dart';
import 'package:taj_elsafa/core/shared/widgets/dropdown_field.dart';
import 'package:taj_elsafa/core/shared/widgets/input_field.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/shared/widgets/media_field.dart';
import 'package:taj_elsafa/core/shared/widgets/selector_field.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/ticket/modules/ticketform/logic/ticket_form_cubit.dart';

part 'widget/ticket_form.dart';
part 'widget/recipient_form.dart';

class TicketFormScreen extends StatelessWidget {
  const TicketFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (TicketFormCubit cubit) => cubit.isLoading && !cubit.isLoaded,
    );
    return BlocListener<TicketFormCubit, TicketFormState>(
      listener: (context, state) {
        state.onSuccess((ticket) {
          context.back(ticket);
          context.showSuccessDialog(
            'Your ticket has been received successfully',
          );
        });

        state.onError(context.showErrorSnackbar);
      },
      child: Scaffold(
        appBar: AppBar(
          leading: AppBackButton(),
          title: const Text('Send Ticket'),
        ),

        body: ConditionalBuilder(
          condition: !isLoading,
          builder: (_) => _Form(),
          fallback: (_) => AppLoadignIndicator(),
        ),

        bottomNavigationBar: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: Color(0xff9F9F9F),
            boxShadow: [
              BoxShadow(color: Color(0x40000000), blurRadius: 10.r),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x40FFFFFF),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40000000),
                  blurRadius: 8.r,
                  offset: Offset(0, 4.h),
                ),
              ],
            ),
            child: AppButton(
              text: 'Send',
              textStyle: AppTextStyles.medium.copyWith(
                color: AppColors.white,
              ),
              color: Color(0x40FFFFFF),

              isLoading:
                  (context) => context.select(
                    (TicketFormCubit cubit) => cubit.isLoading,
                  ),

              onPressed: context.read<TicketFormCubit>().submit,
            ),
          ),
        ),
      ),
    );
  }
}
