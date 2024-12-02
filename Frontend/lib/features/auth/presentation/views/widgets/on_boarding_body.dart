import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Spacer(),
          Column(
            children: [
              Image.asset(MyAssets.onBoardingImg),
              const Text('Save Smart,', style: Styles.textStyle16),
              const Text('Spend Wisely,', style: Styles.textStyle16),
              const Text('Secure Your Future,', style: Styles.textStyle16),
            ],
          ),
          const Spacer(),
          Column(
            children: [
              SizedBox(
                height: 60,
                width: double.infinity,
                child: CustomButton(
                  text: 'Login/Sign Up',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kLoginView);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Continue as a guest',
                style: Styles.textStyle16.copyWith(
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 10),
            ],
          )
        ],
      ),
    );
  }
}
