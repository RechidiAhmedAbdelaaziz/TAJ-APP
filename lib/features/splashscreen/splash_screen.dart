import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taj_elsafa/core/themes/colors.dart';
import 'package:taj_elsafa/gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 1000,
      ), // 1s animation duration
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero, // Start at center
      end: const Offset(-1.5, 0), // Slide to the right
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _fadeAnimation = Tween<double>(
      begin: 1, // Fully visible
      end: 0, // Fade out
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Start animation after 1s delay
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.forward();

      // Navigate after animation completes
      Future.delayed(const Duration(milliseconds: 1000), () {
        // ignore: use_build_context_synchronously
        context.go('/welcome'); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Assets.images.name.image(width: 350),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
