import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:gdg_hackathon/features/auth/data/repos/signup_repo.dart';
import 'package:gdg_hackathon/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/widgets/signup2_body.dart';

class Signup2View extends StatelessWidget {
  const Signup2View({super.key, required this.user});
  final UserSignup user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) => SignupCubit(SignupRepo()),
        child: Signup2Body(user: user),
      )),
    );
  }
}
