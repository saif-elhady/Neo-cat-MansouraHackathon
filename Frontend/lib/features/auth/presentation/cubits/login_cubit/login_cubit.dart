import 'package:bloc/bloc.dart';
import 'package:gdg_hackathon/core/models/user.dart';
import 'package:gdg_hackathon/features/auth/data/repos/login_repo.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepo) : super(LoginInitial());
  final LoginRepo loginRepo;
  final box = GetStorage();

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    var response = await loginRepo.loginUser(email: email, password: password);
    response.fold(
      (l) {
        emit(LoginFailure(errMessage: l.errMessage));
      },
      (r) async {
        final String token = r['accessToken'];
        final String id = JwtDecoder.decode(token)['id'];
        box.write('user_id', id);
        box.write('access_token', token);
        User user = User.fromJson(await loginRepo.getUser());
        emit(LoginSuccess(user: user));
      },
    );
  }
}
