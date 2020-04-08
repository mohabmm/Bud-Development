import 'package:budupdated/core/error/exception.dart';
import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/core/network/network_info.dart';
import 'package:budupdated/features/authntication/data/datasources/firebaseauth_data_source.dart';
import 'package:budupdated/features/authntication/data/repositories/authentication_repository_impl.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockFirebaseDataSource extends Mock implements FirebaseAuthDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  AuthenticationRepositoryImpl repository;
  MockFirebaseDataSource mockFirebaseDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockFirebaseDataSource = MockFirebaseDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = AuthenticationRepositoryImpl(
      firebaseAuthDataSource: mockFirebaseDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('signup autntication', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests
    final tEmail = "mohab_31_8@ghotmail.com";
    final tPassword = "123456";
    final tUid = "634346";
    final tUserDataEntity = UserDataEntity(email: tEmail, uId: tUid);

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.signUpWithEmail(tEmail, tPassword);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockFirebaseDataSource.signUpWithEmail(tEmail, tPassword))
              .thenAnswer((_) async => tUserDataEntity);
          // act
          final result = await repository.signUpWithEmail(tEmail, tPassword);
          // assert
          verify(mockFirebaseDataSource.signUpWithEmail(tEmail, tPassword));
          expect(result, equals(Right(tUserDataEntity)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockFirebaseDataSource.signUpWithEmail(tEmail, tPassword))
              .thenThrow(ServerException());
          // act
          final result = await repository.signUpWithEmail(tEmail, tPassword);
          // assert
          verify(mockFirebaseDataSource.signUpWithEmail(tEmail, tPassword));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should  throw deviceisofflineexception when the device is offline',
        () async {
          // arrange
          when(mockFirebaseDataSource.signUpWithEmail(tEmail, tPassword))
              .thenThrow(DeviceIsOfflineException());
          // act
          final result = await repository.signUpWithEmail(tEmail, tPassword);
          // assert
          expect(result, equals(Left(DeviceIsOfflineFailure())));
        },
      );
    });
  });

  group('login autntication', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests
    final tEmail = "mohab_31_8@ghotmail.com";
    final tPassword = "123456";
    final tUid = "634346";
    final tUserDataEntity = UserDataEntity(email: tEmail, uId: tUid);

    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // act
      repository.loginWithEmail(tEmail, tPassword);
      // assert
      verify(mockNetworkInfo.isConnected);
    });

    runTestsOnline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockFirebaseDataSource.loginWithEmail(tEmail, tPassword))
              .thenAnswer((_) async => tUserDataEntity);
          // act
          final result = await repository.loginWithEmail(tEmail, tPassword);
          // assert
          verify(mockFirebaseDataSource.loginWithEmail(tEmail, tPassword));
          expect(result, equals(Right(tUserDataEntity)));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockFirebaseDataSource.loginWithEmail(tEmail, tPassword))
              .thenThrow(ServerException());
          // act
          final result = await repository.loginWithEmail(tEmail, tPassword);
          // assert
          verify(mockFirebaseDataSource.loginWithEmail(tEmail, tPassword));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });

    runTestsOffline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        'should  throw deviceisofflineexception when the device is offline',
        () async {
          // arrange
          when(mockFirebaseDataSource.loginWithEmail(tEmail, tPassword))
              .thenThrow(DeviceIsOfflineException());
          // act
          final result = await repository.loginWithEmail(tEmail, tPassword);
          // assert
          expect(result, equals(Left(DeviceIsOfflineFailure())));
        },
      );
    });
  });
}
