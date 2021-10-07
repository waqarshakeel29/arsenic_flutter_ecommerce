import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../domain/auth/auth_response.dart';
import '../../../shared/error/server_error.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  // final http.Client client;
  final FirebaseAuth firebaseAuthInstance;

  LoginRemoteDataSourceImpl({required this.firebaseAuthInstance});
  @override
  Future<Either<ServerError, AuthResponse>> loginWithUserNamePassword(
      String userName, String password) async {
    try {
      UserCredential? userCredential = await firebaseAuthInstance
          .signInWithEmailAndPassword(email: userName, password: password);

      if (userCredential.user != null) {
        return Right(AuthResponse.fromUser(userCredential.user!));
      } else {
        return Left(ServerError());
      }
    } catch (e) {
      return Left(ServerError());
    }
  }

  @override
  Future<Either<ServerError, AuthResponse>> signUpWithUserNamePassword(
      String name, String userName, String password) async {
    try {
      UserCredential? userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userName,
        password: password,
      );

      if (userCredential.user != null) {
        userCredential.user!.updateDisplayName(name).then((value) {
          print("Profile has been changed successfully");
        }).catchError((e) {
          print("There was an error updating profile");
        });
        return Right(AuthResponse.fromUser(userCredential.user!));
      } else {
        return Left(ServerError());
      }
    } catch (e) {
      return Left(ServerError());
    }
  }
}
