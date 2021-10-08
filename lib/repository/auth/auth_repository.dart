import 'package:arsenic_flutter_ecommerce/shared/error/auth/signup_error.dart';
import 'package:dartz/dartz.dart';
import '../../domain/auth/app_user.dart';
import '../../shared/error/auth/login_error.dart';

abstract class LoginRepository {
  Future<Either<LoginError, AppUser>> loginWithUserNamePassword(
      String userName, String password);

  Future<Either<SignUpError, AppUser>> signUpWithUserNamePassword(
      String name, String userName, String password);
  // Future<Either<None, AppUser>> checkAndRefreshIfUserLoggedIn();
  // Future<AuthResponse?> isUserLoggedIn();
}
