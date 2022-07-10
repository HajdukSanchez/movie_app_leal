part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent([listProps = const []]);
}

/// Event to handle the user log in.
class AuthLoginEvent extends AuthEvent {
  final Auth auth;

  const AuthLoginEvent({required this.auth});

  @override
  List<Object?> get props => [auth];
}

/// Event to handle the user log out.
class AuthLogoutEvent extends AuthEvent {
  const AuthLogoutEvent();

  @override
  List<Object?> get props => [];
}
