import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taj_elsafa/core/extension/bottom_sheet.extension.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/dialog.extension.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/loadign_indicator.dart';
import 'package:taj_elsafa/core/shared/widgets/states_page.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/request/config/request_navigator.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';
import 'package:taj_elsafa/features/request/modules/requests/logic/requests_cubit.dart';
import 'package:taj_elsafa/features/request/modules/requests/ui/reques_details_screen.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

part 'widget/request_item.dart';
part 'widget/filter_button.dart';
part 'widget/qr_code.dart';

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
      isLoading: isLoading,

      builder: (context, state) {
        final requests = context.select(
          (RequestsCubit cubit) => cubit.requests,
        );
        return Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 25.h,
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

              if (requests.isEmpty)
                Expanded(
                  child: Center(
                    child: Text(
                      'No Requests'.tr(context),
                      style: AppTextStyles.medium,
                    ),
                  ),
                )
              else
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...requests.map(
                          (request) => _RequestItem(request),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },

      floatingActionButton: InkWell(
        onTap: () => context.to(RequestNavigator.createRequest()),
        child: SvgPicture.asset(Assets.icons.addButton),
      ),
    );
  }
}
