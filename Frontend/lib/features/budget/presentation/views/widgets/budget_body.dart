import 'package:flutter/material.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class BudgetBody extends StatelessWidget {
  const BudgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'October Budget',
        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
