import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  @override
  void initState() {
    initAnimation();
    navigateToOnBoarding();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Image.asset(
          MyAssets.logo,
        ),
      ),
    );
  }

  void initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    controller.forward();
  }

  Future<void> navigateToOnBoarding() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        if (mounted) {
          GoRouter.of(context).go(AppRouter.kOnBoardingView);
        }
      },
    );
  }
}
