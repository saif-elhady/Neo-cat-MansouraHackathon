import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/signup_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SignupBody()),
    );
  }
}
