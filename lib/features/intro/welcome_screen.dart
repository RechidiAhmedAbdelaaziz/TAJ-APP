import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taj_elsafa/core/extension/navigator.extension.dart';
import 'package:taj_elsafa/core/themes/font_styles.dart';
import 'package:taj_elsafa/features/auth/configs/auth_navigator.dart';
import 'package:video_player/video_player.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset('assets/videos/intro.mp4')
          ..setLooping(true)
          ..initialize().then((_) {
            _controller.play();
            _controller.setVolume(0);
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    // show video and up of it show Login button
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child:
                _controller.value.isInitialized
                    ? Container(
                      color: Colors.black,
                      child: VideoPlayer(_controller),
                    )
                    : const CircularProgressIndicator(),
          ),
          Positioned(
            bottom: 52.h,
            left: 150.w,
            right: 150.w,
            child: InkWell(
              onTap: () => context.to(AuthNavigator.login()),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 17.h),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.55),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(
                        (0.25 * 255).toInt(),
                      ),
                      blurRadius: 12,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Text(
                      'Login',
                      style: AppTextStyles.medium.copyWith(
                        foreground:
                            Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2
                              ..color = Color(0xffC5C1C1),
                      ),
                    ),
                    Text(
                      'Login',
                      style: AppTextStyles.medium.copyWith(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
