import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/core/usecases/usecase.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class LogInUseCase extends UseCase<UserDataEntity, Params> {
  final AuthenticationRepository repository;

  LogInUseCase(this.repository);

  Future<Either<Failure, UserDataEntity>> call(Params params) async {
    return await repository.loginWithEmail(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
