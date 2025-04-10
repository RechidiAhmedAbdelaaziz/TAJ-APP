import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/themes/colors.dart';

class IndicatedPagview extends StatefulWidget {
  final List<Widget> pages;
  final bool isAutoPlay;

  const IndicatedPagview({
    super.key,
    required this.pages,
    this.isAutoPlay = true,
  });

  @override
  State<IndicatedPagview> createState() => _IndicatedPagviewState();
}

class _IndicatedPagviewState extends State<IndicatedPagview> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);

    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page!.round());
    });

    if (widget.isAutoPlay) {
      _timer = Timer.periodic(const Duration(seconds: 4), (
        Timer timer,
      ) {
        if (_currentPage < widget.pages.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (widget.isAutoPlay) _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: widget.pages.length,
          itemBuilder: (_, index) => widget.pages[index],
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildIndicator() => Positioned(
    bottom: 6.h,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        widget.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: _currentPage == index ? 12.w : 8.w,
          height: _currentPage == index ? 12.h : 8.h,
          decoration: BoxDecoration(
            color:
                _currentPage == index
                    ? AppColors.primary
                    : AppColors.white,
            // shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );
}
