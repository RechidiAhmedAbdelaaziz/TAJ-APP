import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/localization.extension.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/pdf_view.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/documents/data/models/document_model.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyDocs'.tr(context))),
      body: DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
          children: [
            TabBar(
              labelColor: AppColors.black,
              indicatorColor: Colors.teal,
              indicatorSize: TabBarIndicatorSize.tab,

              labelPadding: EdgeInsets.zero,

              tabs: [
                _buildTab('Quotation '.tr(context)),
                _buildTab('Invoice '.tr(context)),
                _buildTab('Payment '.tr(context)),
              ],
            ),

            Expanded(
              child: TabBarView(
                children: [
                  _DocumentTabView('Quotation'),
                  _DocumentTabView('Invoice'),
                  _DocumentTabView('Payment'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      color: AppColors.grey,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.spMin,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

final _docs1 = [
  DocumentModel(
    id: '1',
    type: 'Quotation',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'Q12345',
    requestNumber: 'R12345',
  ),
  DocumentModel(
    id: '2',
    type: 'Quotation',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'I12345',
    requestNumber: 'R12345',
  ),
];

final _docs2 = [
  DocumentModel(
    id: '3',
    type: 'Invoice',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'I12345',
    requestNumber: 'R12345',
  ),
  DocumentModel(
    id: '4',
    type: 'Invoice',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'I12345',
    requestNumber: 'R12345',
  ),
];

final _docs3 = [
  DocumentModel(
    id: '5',
    type: 'Payment',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'P12345',
    requestNumber: 'R12345',
  ),
  DocumentModel(
    id: '6',
    type: 'Payment',
    fileUrl:
        'https://www.osureunion.fr/wp-content/uploads/2022/03/pdf-exemple.pdf',
    docNumber: 'P12345',
    requestNumber: 'R12345',
  ),
];

class _DocumentTabView extends StatelessWidget {
  final String title; // used for fetching data from source
  const _DocumentTabView(this.title);

  @override
  Widget build(BuildContext context) {
    final docs =
        title == 'Quotation'
            ? _docs1
            : title == 'Invoice'
            ? _docs2
            : _docs3;
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, index) {
        final doc = docs[index];
        return Container(
          padding: EdgeInsets.all(22.w),
          margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 22.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5).r,
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withAlpha(75),
                blurRadius: 12,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title Number : ${doc.docNumber}',
                style: AppTextStyles.medium,
              ),
              heightSpace(4),
              Text(
                'Request Number : ${doc.requestNumber}',
                style: AppTextStyles.medium,
              ),
              heightSpace(22),

              PdfView.fromUrl(
                url: doc.fileUrl!,
                title: '${doc.docNumber}',
              ),
            ],
          ),
        );
      },
    );
  }
}
