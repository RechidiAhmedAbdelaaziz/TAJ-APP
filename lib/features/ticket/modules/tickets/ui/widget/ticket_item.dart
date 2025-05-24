part of '../tickets_screen.dart';

class _TicketItem extends StatelessWidget {
  final TicketModel ticket;
  const _TicketItem(this.ticket);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(color: Color(0x40000000), blurRadius: 12.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDate(),
          heightSpace(16),

          _buildInfo(
            title: 'Ticket Number:',
            value: ticket.id.toString(),
          ),
          heightSpace(12),
          _buildInfo(title: 'Title:', value: ticket.name),
          heightSpace(12),
          _buildInfo(
            title: 'Ticket Status:',
            value: ticket.stage,
            color: ticket.statusColor,
          ),

          heightSpace(36),

          if (ticket.needConfirmation) ...[
            const Divider(color: Color(0x1A000000), height: 1),
            heightSpace(8),
            Row(
              spacing: 8.w,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(Assets.icons.alert),
                Expanded(
                  child: Text(
                    'Please open the ticket and confirm receipt of the maintenance work.',
                    maxLines: 2,
                    style: AppTextStyles.small.copyWith(
                      color: AppColors.greyDark,
                    ),
                  ),
                ),
              ],
            ),
            heightSpace(20),
          ],

          Row(
            spacing: 8.w,
            children: [
              Expanded(
                child: AppButton(
                  text: 'View Details'.tr(context),
                  textStyle: AppTextStyles.primaryButton.copyWith(
                    color: AppColors.white,
                  ),
                  color: AppColors.buttonColor,

                  onPressed: () {
                    Navigator.push(
                      //TODO change it after create ticket details module
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                TicketDetailsScreen(ticket: ticket),
                      ),
                    );
                  },
                ),
              ),

              if (ticket.qrCodeUrl != null)
                Expanded(
                  child: AppButton(
                    text: 'Open QR'.tr(context),
                    textStyle: AppTextStyles.primaryButton.copyWith(
                      color: AppColors.white,
                    ),
                    color: AppColors.buttonColor,

                    prefixIcon: SvgPicture.asset(Assets.icons.qr),

                    onPressed: () {
                      context.dialog(
                        child: _QrCode(ticket.qrCodeUrl ?? ''),
                      );
                    },
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDate() {
    final date = ticket.createdAt;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          date?.toDayMonthYear() ?? '',
          style: AppTextStyles.small.copyWith(
            color: Color(0x59000000),
          ),
        ),
        Text(
          date?.toHourMinute() ?? '',
          style: AppTextStyles.small.copyWith(
            color: Color(0x59000000),
          ),
        ),
      ],
    );
  }

  Widget _buildInfo({
    required String title,
    String? value,
    Color? color,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.normal.copyWith(
            color: AppColors.black,
          ),
        ),
        Text(
          ' ${value ?? ''}',
          style: AppTextStyles.normal.copyWith(
            color: color ?? AppColors.black,
          ),
        ),
      ],
    );
  }
}
