import 'package:budupdated/core/error/failure.dart';
import 'package:budupdated/core/usecases/usecase.dart';
import 'package:budupdated/features/authntication/domain/entities/user_data.dart';
import 'package:budupdated/features/authntication/domain/repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class SignUpUseCase extends UseCase<UserDataEntity, Params> {
  final AuthenticationRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<Failure, UserDataEntity>> call(Params params) async {
    return await repository.signUpWithEmail(params.email, params.password);
  }
}

class Params extends Equatable {
  final String email;
  final String password;

  Params({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
