import 'package:arsenic_flutter_ecommerce/repository/auth/source/auth_remote_data_source_impl.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/auth/signup_error.dart';
import 'package:dartz/dartz.dart';

import '../../domain/auth/app_user.dart';
import '../../domain/auth/auth_response.dart';
import 'source/auth_remote_data_source.dart';
import '../../shared/error/auth/login_error.dart';

import 'auth_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource loginRemoteDataSource;
  LoginRepositoryImpl({
    required this.loginRemoteDataSource,
  });

  @override
  Future<Either<LoginError, AppUser>> loginWithUserNamePassword(
      String userName, String password) async {
    final result = await loginRemoteDataSource.loginWithUserNamePassword(
        userName, password);
    return result.fold(
      (serverError) => Left(LoginError("Unable to Login")),
      (authResponse) async {
        // await loginLocalDataSource.saveLoggedInCredentials(authResponse);
        return Right(authResponse.appUser);
      },
    );
  }

  @override
  Future<Either<SignUpError, AppUser>> signUpWithUserNamePassword(
      String name, String userName, String password) async {
    final result = await loginRemoteDataSource.signUpWithUserNamePassword(
        name, userName, password);

    return result.fold(
      (serverError) => Left(SignUpError("Unable to Sign Up")),
      (authResponse) async {
        // await loginLocalDataSource.saveLoggedInCredentials(authResponse);
        return Right(authResponse.appUser);
      },
    );
  }

  bool _isTokenExpired(DateTime expiryDate) {
    return DateTime.now().isAfter(expiryDate);
  }

  /// being logged in does not mean that the access token is not expired
  /// and only call [refreshTokenIfExpired] to make it sure
  // @override
  // Future<AuthResponse?> isUserLoggedIn() async {
  //   return await loginLocalDataSource.getCachedLoggedInUser();
  // }

  /// convenience feature for Login BloC to make sure that user is logged in
  ///  with non-expired token on startup
  // @override
  // Future<Either<None, AppUser>> checkAndRefreshIfUserLoggedIn() async {
  //   try {
  //     // return const Left(None());
  //     final authResponse = await isUserLoggedIn();
  //     if (authResponse == null) return const Left(None());

  //     final refreshedAuthResponse = await refreshTokenIfExpired(authResponse);
  //     if (refreshedAuthResponse == null) return const Left(None());
  //     return Right(refreshedAuthResponse.appUser);
  //   } catch (e) {
  //     return const Left(None());
  //   }
  // }

  // @override
  // Future<AuthResponse?> refreshTokenIfExpired(
  //     AuthResponse cachedResponse) async {
  //   if (_isTokenExpired(cachedResponse.tokenExpiry)) {
  //     final refreshResponse =
  //         await loginRemoteDataSource.refreshToken(cachedResponse);
  //     // an error occurred while refreshing
  //     if (refreshResponse.isLeft()) return null;

  //     final AuthResponse newAuthResponse =
  //         refreshResponse.fold((l) => null, (r) => r)!;
  //     return newAuthResponse;
  //   }
  //   return cachedResponse;
  // }
}
