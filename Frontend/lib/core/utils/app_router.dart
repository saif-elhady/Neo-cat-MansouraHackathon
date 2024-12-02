import 'package:gdg_hackathon/core/models/user.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/login_view.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/on_boarding_view.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/signup2_view.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/signup_view.dart';
import 'package:gdg_hackathon/features/auth/presentation/views/verification_view.dart';
import 'package:gdg_hackathon/features/home/presentation/views/balance_update_view.dart';
import 'package:gdg_hackathon/features/home/presentation/views/history_view.dart';
import 'package:gdg_hackathon/features/home/presentation/views/home_view.dart';
import 'package:gdg_hackathon/features/splash/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kSignup2View = '/signup2View';
  static const kVerificationView = '/verificationView';
  static const kHomeView = '/homeView';
  static const kBalanceUpdateView = '/balanceUpdateView';
  static const kOnBoardingView = '/onBoardingView';
  static const kHistoryView = '/HistoryView';
  static const kAddGoalView = '/addGoalView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoardingView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kAddGoalView,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSignupView,
        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: kSignup2View,
        builder: (context, state) =>
            Signup2View(user: state.extra as UserSignup),
      ),
      GoRoute(
        path: kVerificationView,
        builder: (context, state) =>
            VerificationView(email: state.extra as String),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => HomeView(
          user: state.extra as User,
        ),
      ),
      GoRoute(
        path: kBalanceUpdateView,
        builder: (context, state) => const BalanceUpdateView(),
      ),
      GoRoute(
        path: kHistoryView,
        builder: (context, state) => const HistoryView(),
      ),
    ],
  );
}
