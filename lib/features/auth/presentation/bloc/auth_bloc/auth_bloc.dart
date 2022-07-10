import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:movies_app_leal/core/usecases/usecase.dart';
import 'package:movies_app_leal/core/util/failure_to_message.dart';
import 'package:movies_app_leal/features/auth/domain/entities/auth.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/log_out.dart';
import 'package:movies_app_leal/features/auth/domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final LogOut logout;
  final Message message;

  AuthBloc({required this.login, required this.logout, required this.message})
      : super(AuthInitialState()) {
    on<AuthLoginEvent>(_onLogIn);
    on<AuthLogoutEvent>(_onLogOut);
  }

  /// Handle the user log in.
  void _onLogIn(AuthLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState()); // Show the loading state.
    final failureOrAuth = await login(Params(event.auth));

    failureOrAuth.fold(
        (failure) => emit(AuthErrorState(message: message.mapFailureToMessage(failure))),
        (authData) => emit(AuthLoadedState(auth: authData)));
  }

  /// Handle the user log out.
  void _onLogOut(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState()); // Show the loading state.
    final failureOrAuth = await logout(NoParams());

    failureOrAuth.fold(
        (failure) => emit(AuthErrorState(message: message.mapFailureToMessage(failure))),
        (_) => emit(AuthInitialState()));
  }
}
