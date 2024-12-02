import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/history_appbar.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/history_item.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const HistoryAppbar(),
            const SizedBox(height: 32),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const HistoryItem();
              },
            )
          ],
        ),
      ),
    );
  }
}
