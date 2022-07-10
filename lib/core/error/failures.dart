import 'package:equatable/equatable.dart';

/// Failure abstract class to handle errors.
abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

/// Failure to handle sever error.
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

/// Failure to handle cache error.
class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}
