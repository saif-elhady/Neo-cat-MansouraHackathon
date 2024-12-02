import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Color(0XFF2C2C2C),
        leading: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        title: Text(
          'You have added 500 EGP',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          'March 5, 2024',
          style: Styles.textStyle12.copyWith(color: kPrimaryColor),
        ),
        trailing: const Icon(Icons.more_horiz),
      ),
    );
  }
}
