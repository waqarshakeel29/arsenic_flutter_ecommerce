import 'package:arsenic_flutter_ecommerce/domain/auth/app_user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends LoginState {}

class LoadingState extends LoginState {}

class LoadedState extends LoginState {
  final AppUser appUser;

  LoadedState(this.appUser);

  @override
  List<Object> get props => [appUser];
}

class ErrorState extends LoginState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
