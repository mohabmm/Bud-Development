import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/core/network/network_info.dart';
import 'package:budupdated/features/authntication/data/datasources/firebaseauth_data_source.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:budupdated/core/error/exception.dart';

typedef Future<UserDataEntity> _SignUpOrLoginChooser();

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FirebaseAuthDataSource firebaseAuthDataSource;
  final NetworkInfo networkInfo;

  AuthenticationRepositoryImpl(
      {@required this.firebaseAuthDataSource, @required this.networkInfo});

  @override
  Future<Either<Failure, UserDataEntity>> loginWithEmail(
      String email, String passWord) async {
    return await _checkAuth(() {
      return firebaseAuthDataSource.loginWithEmail(email, passWord);
    });
  }

  @override
  Future<Either<Failure, UserDataEntity>> signUpWithEmail(
      String email, String passWord) async {
    return await _checkAuth(() {
      return firebaseAuthDataSource.signUpWithEmail(email, passWord);
    });
  }

  Future<Either<Failure, UserDataEntity>> _checkAuth(
    _SignUpOrLoginChooser signUpOrLoginChooser,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final numberAuth = await signUpOrLoginChooser();
        return Right(numberAuth);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        throw DeviceIsOfflineException();
      } on DeviceIsOfflineException {
        return Left(DeviceIsOfflineFailure());
      }
    }
  }
}
