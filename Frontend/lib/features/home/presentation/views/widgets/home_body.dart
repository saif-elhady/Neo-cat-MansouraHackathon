import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/models/user.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/balance_card.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/home_appbar.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/investment_partners_list_view.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/quick_action_item.dart';
import 'package:go_router/go_router.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeAppbar(name: user.fullName!),
          BalanceCard(balance: user.balance!),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Quick Actions',
            style: Styles.textStyle16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const QuickActionItem(
                    image: MyAssets.expensesImg, text: 'Add Expense'),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kHistoryView);
                  },
                  child: const QuickActionItem(
                      image: MyAssets.historyImg, text: 'Your history'),
                ),
                const QuickActionItem(
                    image: MyAssets.portfolioImg, text: 'Portfolio'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Investment Partners',
                style: Styles.textStyle16,
              ),
              Row(
                children: [
                  Text(
                    'Explore',
                    style: Styles.textStyle16.copyWith(color: kPrimaryColor),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 16,
                    color: kPrimaryColor,
                  )
                ],
              ),
            ],
          ),
          const InvestmentPartnersListView(),
        ],
      ),
    );
  }
}
