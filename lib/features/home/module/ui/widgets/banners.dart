part of '../home_screen.dart';

final _banners = [
  BannerModel(
    id: '1',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTN95v_Wp3ArxMA0_de_60qBBZG2eYFBDO0A&s',
  ),
  BannerModel(
    id: '2',
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI82m2wkwyxYvdjGDo7KW4-dXxEvpIWBVmcQ&s',
  ),
  BannerModel(
    id: '3',
    imageUrl:
        'https://zb2g8qspmxpc-u2909.pressidiumcdn.com/wp-content/uploads/2024/07/Hotels.jpg',
  ),
];

class _Banners extends StatefulWidget {
  const _Banners();

  @override
  State<_Banners> createState() => _BannersState();
}

class _BannersState extends State<_Banners> {
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
      if (_currentPage < _banners.length - 1) {
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
    // page view with indicators
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Stack(
        children: [
          SizedBox(
            height: 226.h,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _banners.length,
              itemBuilder: (context, index) {
                return Image.network(
                  _banners[index].imageUrl!,
                  fit: BoxFit.fill,
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
                _banners.length,
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
