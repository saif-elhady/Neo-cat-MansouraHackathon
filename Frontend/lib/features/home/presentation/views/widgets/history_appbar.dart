import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_back_button.dart';

class HistoryAppbar extends StatelessWidget {
  const HistoryAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBackButton(),
        Text(
          'Your History',
          style: Styles.textStyle20,
        ),
        Icon(Icons.list)
      ],
    );
  }
}
