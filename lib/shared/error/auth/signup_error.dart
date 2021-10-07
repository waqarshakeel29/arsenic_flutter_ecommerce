import '../server_error.dart';

class SignUpError extends ServerError {
  final String message;

  SignUpError(this.message);

  @override
  List<Object> get props => [message];
}
