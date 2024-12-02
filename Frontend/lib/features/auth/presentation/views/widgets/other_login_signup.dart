import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';

class OtherLoginSignup extends StatelessWidget {
  const OtherLoginSignup({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            text,
            style: Styles.textStyle12,
          ),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FontAwesomeIcons.squareFacebook),
            Icon(FontAwesomeIcons.google),
            Icon(FontAwesomeIcons.apple),
          ],
        )
      ],
    );
  }
}
