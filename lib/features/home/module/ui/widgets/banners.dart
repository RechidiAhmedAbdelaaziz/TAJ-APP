part of '../home_screen.dart';

class _Banners extends StatefulWidget {
  const _Banners();

  @override
  State<_Banners> createState() => _BannersState();
}

class _BannersState extends State<_Banners> {
  final List<BannerModel> _banners = [];
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

    final dio = locator<Dio>();
    dio
        .get('api/v1/slides')
        .then((response) {
          if (response.statusCode == 200) {
            final data = response.data['data'] as List;
            _banners.addAll(
              data.map((e) => BannerModel.fromJson(e)).toList(),
            );
            print('Banners fetched successfully: ${_banners.length}');
            setState(() {});
          }
        })
        .catchError((error) {
          // Handle error
          print('Error fetching banners: $error');
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
                  fit: BoxFit.cover,
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
