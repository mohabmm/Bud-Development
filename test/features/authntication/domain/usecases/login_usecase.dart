import 'dart:async';

import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:budupdated/features/authntication/domain/usecases/login_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockLogInRepository extends Mock implements AuthenticationRepository {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseUser extends Mock implements FirebaseUser {}

class MockResult extends Mock implements AuthResult {}

void main() async {
  LogInUseCase usecase;
  MockLogInRepository mockLogInRepository;
  MockFirebaseAuth mockFirebaseAuth;
  MockResult mockResult;
  MockFirebaseUser mockFirebaseUser;

  setUp(() {
    mockLogInRepository = MockLogInRepository();
    mockFirebaseAuth = MockFirebaseAuth();
    mockFirebaseUser = MockFirebaseUser();
    mockResult = MockResult();
    usecase = LogInUseCase(mockLogInRepository);
  });

  final tEmail = "mohab_31_8@hotmail.com";
  final tUid = "634346";
  final tPassword = "123456";

  final tUserDataEntity = UserDataEntity(email: tEmail, uId: tUid);

  test(
    'should get email,uId data  for the user from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When signUpWithEmail is called with any argument, always answer with
      // the Right "side" of Either containing a test UserDataEntity object.
      when(mockLogInRepository.loginWithEmail(any, any))
          .thenAnswer((_) async => Right(tUserDataEntity));

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(email: tEmail, password: tPassword));
      // UseCase should simply return whatever was returned from the Repository
      expect(
          result,
          Right(
              tUserDataEntity)); // here i say that the usecase data equal to repo data
      // Verify that the method has been called on the Repository
      verify(mockLogInRepository.loginWithEmail(tEmail, tPassword));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockLogInRepository);
    },
  );
//
//  test('signUp With Email and Password returns a firebase user', () async {
//    String tEmail = "mohab_31_8@hotmail.com";
//    String tPassword = "123456";
//
//    when(mockFirebaseAuth.signInWithEmailAndPassword(
//      email: tEmail,
//      password: tPassword,
//    )).thenAnswer((_) async => await Future<MockResult>.value(mockResult));
//
//    final user = await Future<MockResult>.value(mockResult).then((user) async{
//      final userEmail = user.user.email;
//      final userId = user.user.uid;
//
  final tResult = await mockFirebaseAuth.signInWithEmailAndPassword(
      email: tEmail, password: tPassword);
//
//      expect(tResult, await Future<MockResult>.value(mockResult));
//
//    });
//
//    verify(mockFirebaseAuth.signInWithEmailAndPassword(
//            email: tEmail, password: tPassword))
//        .called(1);
//  });
}
