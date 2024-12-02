import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key, required this.balance});
  final int balance;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0XFF2C2C2C),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 19),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 200,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Current Balance:',
                      style: Styles.textStyle16
                          .copyWith(color: const Color(0XFFA9A9A9)),
                    ),
                    Text(
                      '$balance EGP',
                      style: Styles.textStyle32,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'You have spent ',
                              style: Styles.textStyle12
                                  .copyWith(color: kPrimaryColor)),
                          const TextSpan(
                              text: '40% ', style: Styles.textStyle12),
                          TextSpan(
                              text: 'of your monthly budget',
                              style: Styles.textStyle12
                                  .copyWith(color: kPrimaryColor)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.kBalanceUpdateView);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: kPrimaryColor,
                  ),
                ),
                const GradientCircularProgressIndicator(
                  size: 60,
                  progress: 0.40, // Specify the progress value between 0 and 1
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(144, 60, 184, 0.5),
                      Color.fromRGBO(144, 60, 184, 0.5)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.topCenter,
                  ),
                  backgroundColor: Color(0XFF903CB8),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
