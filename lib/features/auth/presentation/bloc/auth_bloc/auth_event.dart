part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Event to handle the user log in.
class AuthLoginEvent extends AuthEvent {
  final Auth auth;

  const AuthLoginEvent({required this.auth});
}

/// Event to handle the user log out.
class AuthLogoutEvent extends AuthEvent {}
