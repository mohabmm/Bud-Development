import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, UserDataEntity>> loginWithEmail(
    String email,
    String passWord,
  );
  Future<Either<Failure, UserDataEntity>> signUpWithEmail(
    String email,
    String passWord,
  );
}
