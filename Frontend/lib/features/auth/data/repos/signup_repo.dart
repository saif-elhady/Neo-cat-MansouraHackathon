import 'package:dartz/dartz.dart';
import 'package:gdg_hackathon/core/errors/failures.dart';
import 'package:gdg_hackathon/core/utils/web_services.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';

class SignupRepo {
  WebService webService = WebService();
  Future<Either<Failure, Map<String, dynamic>>> signupUser(
      {required UserSignup user}) async {
    return await webService.signup(user: user);
  }
}
