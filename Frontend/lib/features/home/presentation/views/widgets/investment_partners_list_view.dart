import 'package:flutter/material.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/investment_item.dart';

class InvestmentPartnersListView extends StatelessWidget {
  const InvestmentPartnersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          InvestmentItem(),
          InvestmentItem(),
          InvestmentItem(),
          InvestmentItem(),
        ],
      ),
    );
  }
}
