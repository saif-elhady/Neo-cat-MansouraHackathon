import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/verification_body.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: VerificationBody(email: email)),
    );
  }
}
