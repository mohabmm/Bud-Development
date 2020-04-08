import 'dart:async';
import 'package:budupdated/core/error/exception.dart';
import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:meta/meta.dart';

abstract class FirebaseAuthDataSource {
  ///
  /// Throws a [ServerException] for all error codes.
  ///  ERROR_INVALID_EMAIL` - If the [email] address is malformed.
  ///  ERROR_WRONG_PASSWORD` - If the [password] is wrong.
  /// `ERROR_USER_NOT_FOUND` - If there is no user corresponding to the given [email] address, or if the user has been deleted.
  ///  ERROR_USER_DISABLED` - If the user has been disabled (for example, in the Firebase console)
  ///  ERROR_TOO_MANY_REQUESTS` - If there was too many attempts to sign in as this user.
  ///  ERROR_OPERATION_NOT_ALLOWED` - Indicates that Email & Password accounts are not enabled.
  Future signUpWithEmail(String email, String passWord);

  /// .
  /// Throws same error codes.
  ///
  ///
  Future<UserDataEntity> loginWithEmail(String email, String passWord);
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth auth;

  FirebaseAuthDataSourceImpl({@required this.auth});

  @override
  Future signUpWithEmail(String email, String passWord) async {
    try {
      var user = await auth.createUserWithEmailAndPassword(
          email: email, password: passWord);
      return user;
    } on UnimplementedFailure {
      throw UnimplemntedException();
    }
  }

  @override
  Future<UserDataEntity> loginWithEmail(String email, String passWord) {
    // TODO: implement loginWithEmail
//
//    firebaseAuthPlatform.createUserWithEmailAndPassword(
//        "sdsds", email, passWord);

    return null;
  }
}
