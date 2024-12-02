import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gdg_hackathon/features/auth/data/models/user_signup.dart';
import 'package:gdg_hackathon/features/auth/data/repos/signup_repo.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:shared_preferences/shared_preferences.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(SignupInitial());
  final SignupRepo signupRepo;
  final box = GetStorage();

  Future<void> signupUser({required UserSignup user}) async {
    emit(SignupLoading());
    var response = await signupRepo.signupUser(user: user);
    response.fold(
      (l) {
        emit(SignupFailure(errMessage: l.errMessage));
      },
      (r) async {
        final String token = r['token'];
        final String id = JwtDecoder.decode(token)['id'];
        box.write('user_id', id);
        box.write('access_token', token);
        emit(SignupSuccess());
      },
    );
  }
}
