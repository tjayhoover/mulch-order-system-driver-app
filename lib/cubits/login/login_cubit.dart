import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:driver_app/states/login_state.dart';
import 'package:driver_app/repositories/login_repository.dart';
import 'package:get_it/get_it.dart';

class LoginCubit extends Cubit<LoginState> {
  late LoginRepository loginRepo;
  LoginCubit() : super(LoginInitialState()) {
    loginRepo = GetIt.I<LoginRepository>();
  }

  void logIn(String username, String password) async {
    try {
      emit(LoginLoadingState());
      final user = await loginRepo.login(username, password);
      if (user != null) {
        // In this case the login was successful
        // So we set the currently logged in user
        loginRepo.setCurrentUser(user);
        emit(LoginSuccessState(user));
      } else {
        emit(LoginFailureState());
      }
    } catch (e) {
      emit(LoginFailureState());
    }
  }
}
