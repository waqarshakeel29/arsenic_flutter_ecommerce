import '../server_error.dart';

class LoginError extends ServerError {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}