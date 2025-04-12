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
import 'package:taj_elsafa/features/ticket/config/ticket_navigator.dart';
import 'package:taj_elsafa/features/ticket/data/models/ticket_model.dart';
import 'package:taj_elsafa/features/ticket/modules/tickets/logic/tickets_cubit.dart';
import 'package:taj_elsafa/features/ticket/modules/tickets/ui/ticket_details_screen.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

part 'widget/ticket_item.dart';
part 'widget/filter_button.dart';
part 'widget/qr_code.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select(
      (TicketsCubit cubit) =>
          cubit.tickets.isEmpty && cubit.state.isLoading,
    );
    return StatesPage(
      title: "My Tickets",


      builder: (context, state) {
        if (isLoading) return AppLoadignIndicator();

        final tickets = context.select(
          (TicketsCubit cubit) => cubit.tickets,
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
                    'Track Ticket'.tr(context),
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

              if (tickets.isEmpty)
                Center(
                  child: Text(
                    'No Tickets'.tr(context),
                    style: AppTextStyles.medium,
                  ),
                )
              else
                ...tickets.map((ticket) => _TicketItem(ticket)),
            ],
          ),
        );
      },

      floatingActionButton: InkWell(
        onTap: () => context.to(TicketNavigator.createTicket()),
        child: SvgPicture.asset(Assets.icons.addButton),
      ),
    );
  }
}
