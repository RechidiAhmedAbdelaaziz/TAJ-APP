import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/shared/widgets/states_page.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';
import 'package:taj_elsafa/features/request/modules/requests/logic/requests_cubit.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

part 'widget/request_item.dart';
part 'widget/filter_button.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (RequestsCubit cubit) =>
          cubit.requests.isEmpty && cubit.state.isLoading,
    );
    return StatesPage(
      title: "My Requests",

      onChange:
          (state) =>
              context
                  .read<RequestsCubit>()
                  .getRequests(), //TODO change it to get filtered requests by state

      builder: (context, state) {
        if (isLoading) return AppLoadignIndicator();

        final requests = context.select(
          (RequestsCubit cubit) => cubit.requests,
        );

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 25.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Track Request'.tr(context),
                    style: AppTextStyles.medium.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  _FilterButton(),
                ],
              ),
              heightSpace(4),
              const Divider(color: Color(0x26000000)),
              heightSpace(20),

              ...requests.map((request) => _RequestItem(request)),
            ],
          ),
        );
      },

      floatingActionButton: InkWell(
        onTap: () {}, //TODO: go to add request screen
        child: SvgPicture.asset(Assets.icons.addButton),
      ),
    );
  }
}
