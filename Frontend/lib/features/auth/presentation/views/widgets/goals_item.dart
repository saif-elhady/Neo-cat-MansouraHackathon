import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GoalsItem extends StatelessWidget {
  const GoalsItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0XFF2C2C2C),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vacation Fund',
                  style: Styles.textStyle20,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz))
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.alarm,
                  color: Color(0XFF6F6C69),
                ),
                Text(
                  '5 months left',
                  style: Styles.textStyle14
                      .copyWith(color: const Color(0XFF6F6C69)),
                ),
              ],
            ),
            const SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LinearPercentIndicator(
                  barRadius: const Radius.circular(10),
                  width: 235.0,
                  lineHeight: 5.0,
                  percent: 0.23,
                  backgroundColor: const Color(0xff6F6C69),
                  progressColor: kPrimaryColor,
                ),
                Text(
                  '23%',
                  style: Styles.textStyle16.copyWith(
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
