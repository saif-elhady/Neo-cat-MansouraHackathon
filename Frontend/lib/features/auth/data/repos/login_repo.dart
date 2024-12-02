import 'package:dartz/dartz.dart';
import 'package:gdg_hackathon/core/errors/failures.dart';
import 'package:gdg_hackathon/core/utils/web_services.dart';

class LoginRepo {
  WebService webService = WebService();
  Future<Either<Failure, Map<String, dynamic>>> loginUser(
      {required String email, required String password}) async {
    return await webService.login(email: email, password: password);
  }

  Future<Map<String, dynamic>> getUser() async {
    return await webService.getUser();
  }
}
