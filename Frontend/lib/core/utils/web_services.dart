import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gdg_hackathon/core/errors/failures.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:get_storage/get_storage.dart';

class WebService {
  final String baseUrl =
      'https://neo-cat-mansourahackathon-production.up.railway.app/api';
  final Dio _dio = Dio();
  final box = GetStorage();

  Future<Either<Failure, Map<String, dynamic>>> get(
      {required String endPoint}) async {
    var response = await _dio.get(endPoint);
    return response.data;
  }

  Future<Map<String, dynamic>> getUser() async {
    final Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {'Authorization': 'Bearer ${box.read('access_token')}'},
    ));
    var response = await dio.get('/users/${box.read('user_id')}');
    return response.data;
  }

  Future<Either<Failure, Map<String, dynamic>>> login(
      {required String email, required String password}) async {
    try {
      var response = await _dio.post(
        '$baseUrl/users/login',
        data: {
          'emailAddress': email,
          'password': password,
        },
      );
      return Right(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.error.toString());
      return Left(ServerFailure.fromDioException(e));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> signup(
      {required UserSignup user}) async {
    try {
      var response = await _dio.post(
        '$baseUrl/users/signup',
        data: user.toJson(),
      );
      return Right(response.data);
    } on DioException catch (e) {
      print(e.message);
      print(e.error.toString());
      return Left(ServerFailure.fromDioException(e));
    }
  }
}
