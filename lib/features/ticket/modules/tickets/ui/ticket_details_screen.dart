import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/button.dart';
import 'package:taj_elsafa/core/shared/widgets/indicated_pagview.dart';
import 'package:taj_elsafa/core/shared/widgets/zoomable_widget.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notes/config/notes_navigator.dart';
import 'package:taj_elsafa/features/rating/config/rating_navigator.dart';
import 'package:taj_elsafa/features/ticket/data/models/ticket_model.dart';

class TicketDetailsScreen extends StatelessWidget {
  final TicketModel ticket;
  const TicketDetailsScreen({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: Text("Ticket Details No.${ticket.id}"),
      ),
      body: Column(
        children: [
          if (ticket.needConfirmation) _buildShowNotesButton(context),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfos(),
                  heightSpace(24),
                  _buildAttachments(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar:
          ticket.needConfirmation
              ? Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.buttonColor,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x40000000),
                      blurRadius: 10.r,
                    ),
                  ],
                ),
                child: Row(
                  spacing: 12.w,
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Send A Note',
                        textStyle: AppTextStyles.normal.copyWith(
                          color: AppColors.white,
                        ),
                        borderColor: AppColors.white,
                        onPressed:
                            () => context.to(NotesNavigator.create()),
                      ),
                    ),

                    Expanded(
                      child: AppButton(
                        text: 'Recive',
                        textStyle: AppTextStyles.normal.copyWith(
                          color: AppColors.white,
                        ),
                        borderColor: AppColors.white,
                        color: Color(0x40FFFFFF),

                        onPressed:
                            () =>
                                context.to(RatingNavigator.create()),
                      ),
                    ),
                  ],
                ),
              )
              : null,
    );
  }

  Widget _buildShowNotesButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(color: AppColors.grey),
      child: AppButton(
        text: 'Attached notes',
        textStyle: AppTextStyles.normal.copyWith(
          color: AppColors.black,
        ),
        color: AppColors.buttonColor,
        onPressed: () => context.to(NotesNavigator.notes(ticket)),
      ),
    );
  }

  Widget _buildInfos() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
        boxShadow: [
          BoxShadow(color: const Color(0x40000000), blurRadius: 12.r),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12.w,
        children: [
          _buildInfo('Ticket Type:', ticket.type),

          _buildInfo('Urgency:', ticket.urgency),

          _buildInfo(
            'Maintenance Classification:',
            ticket.maintenanceClassification,
          ),

          _buildInfo(
            'Preferred Appointment:',
            ticket.appointmentDate?.toDayMonthYearHourMinute(),
          ),

          _buildInfo("Title:", ticket.title),

          _buildInfo("Description:", ticket.description),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // spacing: 4.h,
      children: [
        Text(
          title,
          style: AppTextStyles.medium.copyWith(
            color: AppColors.black,
          ),
        ),
        Text(
          value ?? '',
          style: AppTextStyles.normal.copyWith(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildAttachments() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12.w,
      children: [
        Text(
          'Attached Files',
          style: AppTextStyles.medium.copyWith(
            color: AppColors.black,
          ),
        ),

        SizedBox(
          height: 280.h,
          child: IndicatedPagview(
            isAutoPlay: false,
            pages:
                ticket.attachments.map((attachment) {
                  return ZoomableWidget(
                    child: attachment.mediaDto.buildWidget(
                      width: double.infinity,
                      height: 280.h,
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
