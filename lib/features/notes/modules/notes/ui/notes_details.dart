import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/date_formatter.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/indicated_pagview.dart';
import 'package:taj_elsafa/core/shared/widgets/zoomable_widget.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/notes/data/models/note_model.dart';

class NotesDetails extends StatelessWidget {
  final NoteModel note;
  const NotesDetails(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Details No.${note.id}")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Note(note),

            heightSpace(20),
            Text(
              'Attached Files:',
              style: AppTextStyles.medium.copyWith(
                color: AppColors.black,
              ),
            ),

            SizedBox(
              height: 280.h,
              child: IndicatedPagview(
                pages: [
                  ...note.attachments.map(
                    (attachment) => ZoomableWidget(
                      child: attachment.mediaDto.buildWidget(
                        width: double.infinity,
                        height: 280.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Note extends StatelessWidget {
  final NoteModel note;

  const _Note(this.note);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 24.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color(0x40000000), blurRadius: 12.r),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfo('Title:', note.title),
              heightSpace(16),
              _buildInfo('Description:', note.description),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfo(String title, String? value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.medium.copyWith(
            color: AppColors.black,
          ),
        ),
        heightSpace(4),
        Text(
          value ?? '',
          style: AppTextStyles.normal.copyWith(
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
