part of '../real_states_screen.dart';

class _StatesDropdown extends StatelessWidget {
  final RealStateModel realState;
  final void Function(RealStateModel? state) onChanged;

  const _StatesDropdown(this.realState, {required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final states = context.watch<RealStatesCubit>().realStates;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 35.h),
      color: AppColors.grey,
      child: DropdownMenu(
        width: double.infinity,
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
        initialSelection: realState,
        onSelected: onChanged,
      ),
    );
  }
}
