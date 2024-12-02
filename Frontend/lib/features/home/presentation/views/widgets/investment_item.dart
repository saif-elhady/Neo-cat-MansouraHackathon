import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class InvestmentItem extends StatelessWidget {
  const InvestmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Image.asset(MyAssets.btcImg),
      title: Text(
        'BTC Company',
        style: Styles.textStyle16.copyWith(color: kPrimaryColor),
      ),
      subtitle: Text(
        'BTC Gold is a leading company that specializes in the buying and selling of gold and other precious',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Styles.textStyle12.copyWith(color: const Color(0XFFA9A9A9)),
      ),
    );
  }
}
