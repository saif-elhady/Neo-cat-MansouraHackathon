import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class TermsCheckbox extends StatefulWidget {
  const TermsCheckbox({super.key});

  @override
  State<TermsCheckbox> createState() => _TermsCheckboxState();
}

class _TermsCheckboxState extends State<TermsCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isChecked,
          activeColor: kPrimaryColor,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          },
        ),
        Row(
          children: [
            const Text(
              'Agree with ',
              style: Styles.textStyle14,
            ),
            Text(
              'Terms & conditions',
              style: Styles.textStyle14.copyWith(color: kPrimaryColor),
            ),
          ],
        ),
      ],
    );
  }
}
