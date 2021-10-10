import 'package:arsenic_flutter_ecommerce/domain/auth/app_user.dart';
import 'package:arsenic_flutter_ecommerce/domain/auth/auth_response.dart';
import 'package:arsenic_flutter_ecommerce/repository/auth/source/auth_remote_data_source_impl.dart';
import 'package:arsenic_flutter_ecommerce/shared/error/server_error.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([
  FirebaseAuth,
])
void main() {
  group('sign in', () {
    final userName = "i170249@nu.edu.pk";
    final password = "nomi";

    test(
      '''successfull sign in''',
      () async {
        LoginRemoteDataSourceImpl dataSource;
        MockFirebaseAuth mockFirebaseAuth;

        mockFirebaseAuth = MockFirebaseAuth();
        dataSource =
            LoginRemoteDataSourceImpl(firebaseAuthInstance: mockFirebaseAuth);

        when(dataSource.loginWithUserNamePassword(userName, password))
            .thenAnswer((_) async =>
                    // Future<Either<MockServerError, MockAuthResponse>>.value(
                    Right(AuthResponse(
                        accessToken: '',
                        appUser: AppUser(uid: '', userName: ''),
                        tokenExpiry: DateTime.now()))
                // )
                );

        expect(
            await mockFirebaseAuth.signInWithEmailAndPassword(
                email: userName, password: password),
            isA<UserCredential>());
      },
    );
  });
}
