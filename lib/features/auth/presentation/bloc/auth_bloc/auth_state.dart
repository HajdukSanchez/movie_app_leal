part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final Auth? auth;
  final String? message;

  const AuthState({this.auth, this.message});

  @override
  List<Object?> get props => [];
}

/// Intial and empty state of auth.
class AuthInitialState extends AuthState {}

/// Loading state of the auth.
class AuthLoadingState extends AuthState {}

/// Loaded state of the auth.
///
/// This state contains data of the user logged in.
class AuthLoadedState extends AuthState {
  const AuthLoadedState({required auth}) : super(auth: auth);
}

/// Error state of the auth.
///
/// This state contains an error message if something wrong.
class AuthErrorState extends AuthState {
  const AuthErrorState({required message}) : super(message: message);
}
