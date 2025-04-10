part of '../real_states_screen.dart';

class StatesHeader extends StatelessWidget {
  final ValueChanged<RealStateModel>? onChange;

  const StatesHeader({super.key, this.onChange});

  @override
  Widget build(BuildContext context) {
    final controller =
        context.read<RealStatesCubit>().selectedStateController;

    final states = context.select(
      (RealStatesCubit cubit) => cubit.states,
    );

    return ValueListenableBuilder(
      valueListenable: controller,
      builder: (context, state, _) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 35.h,
          ),
          color: AppColors.grey,
          child: Column(
            children: [
              _buildWarrantyStatus(state),
              _buildDropDown(states, state, controller),
              _buildWarrantyInfos(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildWarrantyStatus(RealStateModel? state) {
    return state?.waarrantyIsActive == null
        ? const SizedBox.shrink()
        : Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Warranty Status :',
                  style: AppTextStyles.small.copyWith(
                    color: AppColors.black,
                  ),
                ),
                Container(
                  width: 28.w,
                  height: 15.h,
                  decoration: BoxDecoration(
                    color:
                        state?.waarrantyIsActive == true
                            ? Colors.green
                            : Colors.red,
                    borderRadius: BorderRadius.circular(50).r,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1.w,
                    ),
                  ),
                ),
              ],
            ),
            heightSpace(20),
          ],
        );
  }

  Widget _buildWarrantyInfos(RealStateModel? state) {
    return (state?.warrantyEndDate == null ||
            state?.ticketsLeft == null)
        ? const SizedBox.shrink()
        : Column(
          children: [
            heightSpace(22),
            const Divider(color: Color(0x59FFFFFF)),
            heightSpace(10),
            _buildInfo(
              'Warranty Valid Till :',
              state!.warrantyEndDate!.toDayMonthYear(),
            ),
            heightSpace(4),
            _buildInfo(
              'Tickets Left :',
              //  [tickets left] in this form 000000001
              state.ticketsLeft!.toString().padLeft(9, '0'),
            ),
          ],
        );
  }

  Widget _buildInfo(String title, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.small.copyWith(color: AppColors.black),
        ),
        Text(
          info,
          style: AppTextStyles.small.copyWith(color: AppColors.black),
        ),
      ],
    );
  }

  DropdownMenu<RealStateModel> _buildDropDown(
    List<RealStateModel> states,
    RealStateModel? value,
    EditingController<RealStateModel> controller,
  ) {
    return DropdownMenu(
      width: double.infinity,
      hintText: "Select State ...",
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.white.withValues(alpha: 0.25),
        filled: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5).r,
          borderSide: BorderSide(color: AppColors.white),
        ),

        outlineBorder: BorderSide(color: AppColors.white),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5).r,
          borderSide: BorderSide(color: AppColors.white),
        ),

        contentPadding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),

        isCollapsed: true,
        isDense: true,
      ),

      trailingIcon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.black,
        size: 35.r,
      ),

      selectedTrailingIcon: Icon(
        Icons.keyboard_arrow_up,
        color: AppColors.black,
        size: 35.r,
      ),

      dropdownMenuEntries:
          states
              .map(
                (state) => DropdownMenuEntry(
                  value: state,
                  label: state.name ?? "",
                ),
              )
              .toList(),
      // initialSelection: value,
      onSelected: (value) {
        if (value == null) return;
        controller.setValue(value);
        onChange?.call(value);
      },
    );
  }
}
