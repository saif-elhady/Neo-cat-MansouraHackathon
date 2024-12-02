import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/assets.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_back_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';

class VerificationBody extends StatelessWidget {
  const VerificationBody({super.key, required this.email});
  final String email;

  static final TextEditingController otp = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 40),
          child: IntrinsicHeight(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  const CustomBackButton(),
                  const SizedBox(height: 12),
                  Image.asset(MyAssets.otpImg),
                  const Center(
                    child: Text(
                      'OTP Verification',
                      style: Styles.textStyle24,
                    ),
                  ),
                  const Center(
                    child: Text(
                      'Please enter the code we just sent to your email a******@gmail.com',
                      style: Styles.textStyle14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'OTP',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a valid OTP';
                      }
                      return null;
                    },
                    controller: otp,
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text(
                      'Didn’t receive OTP?',
                      style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFF818181)),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Resend code',
                        style: Styles.textStyle16.copyWith(
                            fontWeight: FontWeight.w400, color: kPrimaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 56),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Verify Code',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          GoRouter.of(context).go(AppRouter.kHomeView);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
