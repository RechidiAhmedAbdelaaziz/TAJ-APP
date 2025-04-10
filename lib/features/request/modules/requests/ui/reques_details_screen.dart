import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/indicated_pagview.dart';
import 'package:taj_elsafa/core/shared/widgets/zoomable_widget.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/request/data/models/request_model.dart';

class RequesDetailsScreen extends StatelessWidget {
  final RequestModel request;
  const RequesDetailsScreen({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Request Details No.${request.id}")),
      body: SingleChildScrollView(
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
          _buildInfo('Ticket Type:', request.type),

          _buildInfo('Urgency:', request.urgency),

          _buildInfo(
            'Maintenance Classification:',
            request.maintenanceClassification,
          ),

          _buildInfo(
            'Preferred Appointment:',
            request.appointmentDate?.toDayMonthYearHourMinute(),
          ),

          _buildInfo("Title:", request.title),

          _buildInfo("Description:", request.description),
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
                request.attachments.map((attachment) {
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
