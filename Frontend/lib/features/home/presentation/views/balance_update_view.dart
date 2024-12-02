import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/balance_update_body.dart';

class BalanceUpdateView extends StatelessWidget {
  const BalanceUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BalanceUpdateBody(),
      ),
    );
  }
}
