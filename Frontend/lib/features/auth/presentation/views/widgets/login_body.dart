import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_hackathon/constants.dart';
import 'package:gdg_hackathon/core/functions/input_validation.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/core/utils/styles.dart';
import 'package:gdg_hackathon/core/widgets/custom_button.dart';
import 'package:gdg_hackathon/core/widgets/custom_text_field.dart';
import 'package:gdg_hackathon/features/auth/presentation/cubits/login_cubit/login_cubit.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/login_header.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/other_login_signup.dart';
import 'package:go_router/go_router.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  static final TextEditingController email = TextEditingController();
  static final TextEditingController password = TextEditingController();
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
                  const SizedBox(height: 90),
                  const LoginHeader(),
                  const SizedBox(height: 60),
                  CustomTextField(
                    label: 'Email',
                    validator: validateEmail,
                    controller: email,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    label: 'Password',
                    isObscure: true,
                    validator: validatePassword,
                    controller: password,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Forget password?',
                    style: Styles.textStyle12.copyWith(color: kPrimaryColor),
                  ),
                  const SizedBox(height: 30),
                  const OtherLoginSignup(
                    text: 'Or log in with',
                  ),
                  const Spacer(),
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginSuccess) {
                        GoRouter.of(context)
                            .go(AppRouter.kHomeView, extra: state.user);
                      } else if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("state.errMessage"),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return state is LoginLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: CustomButton(
                                text: 'Login',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    BlocProvider.of<LoginCubit>(context)
                                        .loginUser(
                                            email: email.text,
                                            password: password.text);
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
                        'Don’t have an account? ',
                        style: Styles.textStyle14,
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kSignupView);
                        },
                        child: Text(
                          'Create One',
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
