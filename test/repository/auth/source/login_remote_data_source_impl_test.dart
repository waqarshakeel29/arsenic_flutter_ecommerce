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
  // User,
  // UserCredential,
  // AuthResponse,
  // ServerError,
  // AppUser,
])
void main() {
  // void setUpMockHttpClientSuccess200() {
  //   when(mockFirebaseAuth.get(any, headers: anyNamed('headers')))
  //       .thenAnswer((_) async => http.Response(fixture('trivia.json'), 200));
  // }

  // void setUpMockHttpClientFailure404() {
  //   when(mockHttpClient.get(any, headers: anyNamed('headers')))
  //       .thenAnswer((_) async => http.Response('Something went wrong', 404));
  // }

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

        // when(mockFirebaseAuth.currentUser).thenAnswer((_) => MockUser());
        // when(mockFirebaseAuth.signInWithEmailAndPassword(
        //         email: userName, password: password))
        //     .thenAnswer((_) async => MockUserCredential());

        when(dataSource.loginWithUserNamePassword(userName, password))
            .thenAnswer((_) async =>
                    // Future<Either<MockServerError, MockAuthResponse>>.value(
                    Right(AuthResponse(
                        accessToken: '',
                        appUser: AppUser(uid: '', userName: ''),
                        tokenExpiry: DateTime.now()))
                // )
                );

        // arrange
        // setUpMockHttpClientSuccess200();
        // act

        // assert
        // verify(
        //   await mockFirebaseAuth.signInWithEmailAndPassword(
        //       email: userName, password: password),
        // );
        expect(
            await mockFirebaseAuth.signInWithEmailAndPassword(
                email: userName, password: password),
            isA<UserCredential>());

        // expect(
        //     (dataSource.loginWithUserNamePassword(userName, password))
        //     // .fold((loginError) => LoginError("Unable to Login"),
        //     //     (authResponse) => authResponse.appUser)
        //     ,
        //     isA<LoginError>());
      },
    );

    // test(
    //   'should return NumberTrivia when the response code is 200 (success)',
    //   () async {
    //     // arrange
    //     setUpMockHttpClientSuccess200();
    //     // act
    //     final result = await dataSource.getConcreteNumberTrivia(tNumber);
    //     // assert
    //     expect(result, equals(tNumberTriviaModel));
    //   },
    // );

    // test(
    //   'should throw a ServerException when the response code is 404 or other',
    //   () async {
    //     // arrange
    //     setUpMockHttpClientFailure404();
    //     // act
    //     final call = dataSource.getConcreteNumberTrivia;
    //     // assert
    //     expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
    //   },
    // );
  });

  // group('getRandomNumberTrivia', () {
  //   final tNumberTriviaModel =
  //       NumberTriviaModel.fromJson(json.decode(fixture('trivia.json')));

  //   test(
  //     '''should perform a GET request on a URL with number
  //      being the endpoint and with application/json header''',
  //     () async {
  //       // arrange
  //       setUpMockHttpClientSuccess200();
  //       // act
  //       dataSource.getRandomNumberTrivia();
  //       // assert
  //       verify(mockHttpClient.get(
  //         'http://numbersapi.com/random',
  //         headers: {
  //           'Content-Type': 'application/json',
  //         },
  //       ));
  //     },
  //   );

  //   test(
  //     'should return NumberTrivia when the response code is 200 (success)',
  //     () async {
  //       // arrange
  //       setUpMockHttpClientSuccess200();
  //       // act
  //       final result = await dataSource.getRandomNumberTrivia();
  //       // assert
  //       expect(result, equals(tNumberTriviaModel));
  //     },
  //   );

  //   test(
  //     'should throw a ServerException when the response code is 404 or other',
  //     () async {
  //       // arrange
  //       setUpMockHttpClientFailure404();
  //       // act
  //       final call = dataSource.getRandomNumberTrivia;
  //       // assert
  //       expect(() => call(), throwsA(TypeMatcher<ServerException>()));
  //     },
  //   );
  // });
}
