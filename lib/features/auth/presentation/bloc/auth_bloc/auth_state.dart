part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState([List props = const <dynamic>[]]);
}

/// Intial and empty state of auth.
class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

/// Loading state of the auth.
class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

/// Loaded state of the auth.
///
/// This state contains data of the user logged in.
class AuthLoadedState extends AuthState {
  final Auth auth;

  const AuthLoadedState({required this.auth});

  @override
  List<Object?> get props => [auth];
}

/// Error state of the auth.
///
/// This state contains an error message if something wrong.
class AuthErrorState extends AuthState {
  final String message;

  const AuthErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
