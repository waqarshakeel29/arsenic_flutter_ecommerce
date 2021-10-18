import 'package:arsenic_flutter_ecommerce/controller/auth/login_event.dart';
import 'package:arsenic_flutter_ecommerce/controller/auth/login_state.dart';
import 'package:arsenic_flutter_ecommerce/domain/auth/app_user.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/auth_repository.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/auth/login_error.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/auth/signup_error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(LoginState initialState, {required this.loginRepository})
      : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserEvent) {
      yield LoadingState();
      Either<LoginError, AppUser> response = await loginRepository
          .loginWithUserNamePassword(event.userName, event.password);
      print(response.toString());
      yield response.fold((failure) => ErrorState(message: "Unable to Login"),
          (appUser) => LoadedState(appUser));
    } else if (event is SignUpUserEvent) {
      yield LoadingState();
      Either<SignUpError, AppUser> response =
          await loginRepository.signUpWithUserNamePassword(
              event.name, event.userName, event.password);
      print(response.toString());
      yield response.fold(
        (failure) => ErrorState(message: "Unable Sign Up"),
          (appUser) => LoadedState(appUser));
    }
  }
}
