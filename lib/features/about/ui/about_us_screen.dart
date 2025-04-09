import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/shared/classes/dimensions.dart';
import 'package:taj_elsafa/core/shared/widgets/back_button.dart';
import 'package:taj_elsafa/core/shared/widgets/logo.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBackButton(),
        title: const Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              heightSpace(32),

              AppLogo(width: 159.w, height: 100.h),
              heightSpace(32),

              Text(
                'Taj AL Safa Real Estate Development was established in Amman in 2014 by industry specialists with more than 20 years of expertise in the real estate business. We provide our customers with a diverse choice of outstanding high-end residential and commercial projects. We also offer our clients a unique array of services and professional guidance to assist them in making the finest property decisions. We embrace change and constantly challenge tradition because we strongly desire to improve the construction method and raise the efficiency and quality of our projects to meet customer\'s needs, requirements, and well-being.',
                style: AppTextStyles.medium.copyWith(
                  color: Colors.black,
                ),
              ),
              heightSpace(64),

              ...{
                "integrity":
                    "We uphold the highest ethical standards, ensuring transparency, trust, and accountability in all our dealings .",

                "excellence":
                    "We relentlessly pursue excellence in design, construction, and service, setting new benchmarks for luxury Living .",

                "innovation":
                    "We embrace innovation to create homes that harmonise modernity with timeless elegance, integrating the latest technology and sustainable practices .",

                "customer-centric":
                    "Our clients are at the heart of everything we do. We prioritise their needs, offering personalised experiences and solutions .",

                "sustainability":
                    "Taj Alsafa Real Estate Development was established in Amman in 2014 by industry specialists with more than 20 years of expertise in the real estate business. We provide our customers with a diverse choice of outstanding high-end residential and commercial projects. We also offer our clients a unique array of services and professional guidance to assist them in making the finest property decisions.  We embrace change and constantly challenge tradition because we strongly desire to improve the construction method and raise the efficiency and quality of our projects to meet customers' needs, requirements, and well-being.",
              }.entries.map((e) => _boxedText(e.key, e.value)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boxedText(String title, String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(8).r,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.large.copyWith(color: Colors.black),
          ),
          heightSpace(12),
          Text(
            text,
            style: AppTextStyles.medium.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
