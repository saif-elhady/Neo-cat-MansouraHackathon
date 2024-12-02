import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/history_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HistoryBody()),
    );
  }
}
