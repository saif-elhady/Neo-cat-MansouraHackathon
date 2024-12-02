import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class QuickActionItem extends StatelessWidget {
  const QuickActionItem({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 60,
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: Styles.textStyle14,
        ),
      ],
    );
  }
}
