import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_back_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:gdg_hackathon/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:gdg_hackathon/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/other_login_signup.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/signup_header.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/terms_checkbox.dart';
import 'package:go_router/go_router.dart';

class Signup2Body extends StatelessWidget {
  const Signup2Body({super.key, required this.user});
  final UserSignup user;
  static final TextEditingController nationalId = TextEditingController();
  static final TextEditingController jobTitle = TextEditingController();
  static final TextEditingController monthlyIncome = TextEditingController();
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
                  const SizedBox(height: 24),
                  const SignupHeader(),
                  const SizedBox(height: 60),
                  CustomTextField(
                    label: 'National ID',
                    validator: validateNationalId,
                    controller: nationalId,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Job Title',
                    validator: validateJobTitle,
                    controller: jobTitle,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Monthly Income',
                    validator: validateIncome,
                    controller: monthlyIncome,
                  ),
                  const SizedBox(height: 0),
                  const TermsCheckbox(),
                  const SizedBox(height: 30),
                  const OtherLoginSignup(
                    text: 'Or sign up with',
                  ),
                  const Spacer(),
                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        GoRouter.of(context).push(AppRouter.kVerificationView,
                            extra: user.emailAddress);
                      } else if (state is SignupFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("state.errMessage"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is SignupLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: CustomButton(
                                text: 'Sign Up',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    UserSignup newUser = UserSignup(
                                      emailAddress: user.emailAddress,
                                      fullName: user.fullName,
                                      password: user.password,
                                      phoneNumber: user.phoneNumber,
                                      nationalId: int.parse(nationalId.text),
                                      jobTitle: jobTitle.text,
                                      monthlyIncome:
                                          int.parse(monthlyIncome.text),
                                    );
                                    BlocProvider.of<SignupCubit>(context)
                                        .signupUser(user: newUser);
                                  }
                                },
                              ),
                            );
                    },
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
