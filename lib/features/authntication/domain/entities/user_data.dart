import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class UserDataEntity extends Equatable {
  final String email;
  final String uId;

  UserDataEntity({
    @required this.email,
    @required this.uId,
  });

  @override
  List<Object> get props => [email, uId];
}
