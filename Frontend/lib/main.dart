import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_hackathon/core/utils/app_router.dart';
import 'package:gdg_hackathon/features/auth/data/repos/login_repo.dart';
import 'package:gdg_hackathon/features/auth/presentation/cubits/login_cubit/login_cubit.dart';

import 'package:gdg_hackathon/features/home/data/repos/balance_repo.dart';
import 'package:gdg_hackathon/features/home/presentation/cubits/balance_cubit/balance_cubit.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(LoginRepo()),
        ),
        BlocProvider(
          create: (context) => BalanceCubit(BalanceRepo()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
