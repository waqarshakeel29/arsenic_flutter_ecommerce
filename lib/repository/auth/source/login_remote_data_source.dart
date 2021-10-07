import 'package:dartz/dartz.dart';
import '../../../domain/auth/auth_response.dart';
import '../../../shared/error/server_error.dart';

abstract class LoginRemoteDataSource {
  Future<Either<ServerError, AuthResponse>> loginWithUserNamePassword(
      String userName, String password);

  Future<Either<ServerError, AuthResponse>> signUpWithUserNamePassword(
      String name, String userName, String password);
}
