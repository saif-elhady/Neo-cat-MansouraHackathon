import 'package:dartz/dartz.dart';
import 'package:gdg_hackathon/core/errors/failures.dart';
import 'package:gdg_hackathon/core/utils/web_services.dart';

class BalanceRepo {
  WebService webService = WebService();
  Future<Either<Failure, Map<String, dynamic>>> getBalance(
      {required String email, required String password}) async {
    return await webService.get(endPoint: '');
  }

  Future<Either<Failure, Map<String, dynamic>>> updateBalance(
      {required String email, required String password}) async {
    return await webService.get(endPoint: '');
  }
}
