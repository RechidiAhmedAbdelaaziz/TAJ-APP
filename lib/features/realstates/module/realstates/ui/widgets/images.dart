part of '../real_states_screen.dart';

class _Images extends StatefulWidget {
  final List<String> images;
  const _Images(this.images);

  @override
  State<_Images> createState() => _ImagesState();
}

class _ImagesState extends State<_Images> {
  late Timer _timer;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentPage);

    _pageController.addListener(() {
      setState(() => _currentPage = _pageController.page!.round());
    });

    _timer = Timer.periodic(const Duration(seconds: 4), (
      Timer timer,
    ) {
      if (_currentPage < widget.images.length - 1) {
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

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Stack(
        children: [
          SizedBox(
            height: 247.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.images[index],
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  width: double.infinity,
                );
              },
            ),
          ),
          Positioned(
            bottom: 6.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                widget.images.length,
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
          ),
        ],
      ),
    );
  }
}
