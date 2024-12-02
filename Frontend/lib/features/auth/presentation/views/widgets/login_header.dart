import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Login',
            style: Styles.textStyle36,
          ),
          Text(
            'welcome Back!',
            style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
