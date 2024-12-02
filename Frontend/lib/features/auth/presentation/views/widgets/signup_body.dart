import 'package:flutter/material.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/other_login_signup.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:go_router/go_router.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

  static final TextEditingController name = TextEditingController();
  static final TextEditingController email = TextEditingController();
  static final TextEditingController phoneNumber = TextEditingController();
  static final TextEditingController password = TextEditingController();
  static final TextEditingController confirmPassword = TextEditingController();
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
                  const SizedBox(height: 40),
                  const SignupHeader(),
                  const SizedBox(height: 60),
                  CustomTextField(
                    label: 'Name',
                    validator: validateName,
                    controller: name,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Email',
                    validator: validateEmail,
                    controller: email,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Phone number',
                    validator: validatePhoneNumber,
                    controller: phoneNumber,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Password',
                    isObscure: true,
                    validator: validatePassword,
                    controller: password,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Confirm Password',
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password confirmation is required';
                      }
                      if (value != password.text) {
                        return 'Must match the password';
                      }
                      return null;
                    },
                    controller: confirmPassword,
                  ),
                  const SizedBox(height: 30),
                  const OtherLoginSignup(
                    text: 'Or sign up with',
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Continue',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          UserSignup user = UserSignup(
                            fullName: name.text,
                            emailAddress: email.text,
                            phoneNumber: int.parse(phoneNumber.text),
                            password: password.text,
                          );
                          GoRouter.of(context)
                              .push(AppRouter.kSignup2View, extra: user);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: Styles.textStyle14,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          'LogIn',
                          style:
                              Styles.textStyle14.copyWith(color: kPrimaryColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
