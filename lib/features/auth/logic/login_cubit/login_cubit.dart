import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/data/repos/auth_repo.dart';
import '../../data/models/user_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authRepo) : super(LoginInitial());
  final AuthRepo _authRepo;

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await _authRepo.signinWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(message: failure.message)),
      (user) => emit(LoginSuccess(user: user)),
    );
  }
}
