import '../server_error.dart';

class ItemsFetchError extends ServerError {
  final String message;

  ItemsFetchError(this.message);

  @override
  List<Object> get props => [message];
}
