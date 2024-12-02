import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/home/presentation/views/widgets/balance_appbar.dart';

class BalanceUpdateBody extends StatelessWidget {
  const BalanceUpdateBody({super.key});
  static final TextEditingController newBalance = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const BalanceAppbar(),
            const SizedBox(height: 40),
            CustomTextField(
              label: 'New Balance',
              controller: newBalance,
              validator: validateBalance,
            ),
            const SizedBox(height: 450),
            SizedBox(
              height: 57,
              width: double.infinity,
              child: CustomButton(
                text: 'Save',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
