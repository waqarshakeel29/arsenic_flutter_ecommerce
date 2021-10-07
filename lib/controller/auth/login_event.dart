import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginUserEvent extends LoginEvent {
  final String userName;
  final String password;

  LoginUserEvent(this.userName, this.password);

  @override
  List<Object> get props => [userName, password];
}

class SignUpUserEvent extends LoginEvent {
  final String name;
  final String userName;
  final String password;

  SignUpUserEvent(this.name, this.userName, this.password);

  @override
  List<Object> get props => [name, userName, password];
}
