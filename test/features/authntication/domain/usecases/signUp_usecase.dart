import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:budupdated/features/authntication/domain/usecases/signUp_useCase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSignUpRepository extends Mock implements AuthenticationRepository {}

void main() async {
  SignUpUseCase usecase;
  MockSignUpRepository mockSignUpRepository;

  setUp(() {
    mockSignUpRepository = MockSignUpRepository();
    usecase = SignUpUseCase(mockSignUpRepository);
  });

  final tEmail = "mohab_31_8@hotmail.com";
  final tPassword = "123456";
  final tUid = "634346";

  final tUserDataEntity = UserDataEntity(email: tEmail, uId: tUid);

  test(
    'should get email,uId data  for the user from the repository',
    () async {
      // "On the fly" implementation of the Repository using the Mockito package.
      // When signUpWithEmail is called with any argument, always answer with
      // the Right "side" of Either containing a test UserDataEntity object.
      when(mockSignUpRepository.signUpWithEmail(any, any))
          .thenAnswer((_) async => Right(tUserDataEntity));

      // The "act" phase of the test. Call the not-yet-existent method.
      final result = await usecase(Params(email: tEmail, password: tPassword));
      // UseCase should simply return whatever was returned from the Repository
      expect(
          result,
          Right(
              tUserDataEntity)); // here i say that the usecase data equal to repo data
      // Verify that the method has been called on the Repository
      verify(mockSignUpRepository.signUpWithEmail(tEmail, tPassword));
      // Only the above method should be called and nothing more.
      verifyNoMoreInteractions(mockSignUpRepository);
    },
  );
}
