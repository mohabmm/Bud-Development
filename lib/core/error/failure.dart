import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const <dynamic>[];
  @override
  List<Object> get props => [properties];
}

// General failures
class ServerFailure extends Failure {}

class DeviceIsOfflineFailure extends Failure {}

class UnimplementedFailure extends Failure {}
