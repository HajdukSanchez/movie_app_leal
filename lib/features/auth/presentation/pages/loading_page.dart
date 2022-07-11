import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/welcome_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/navigator_page.dart';
import 'package:movies_app_leal/injection_dependency_container.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authBloc = sl<AuthBloc>();

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          if (state.runtimeType is AuthErrorState) {
            // TODO: add error dialog
          }

          switch (state.runtimeType) {
            case AuthInitialState:
              return const WelcomePage();
            case AuthLoadingState:
              return const _LoadingIndicator();
            case AuthLoadedState:
              return const NavigatorPage();
            default:
              return const WelcomePage();
          }
        },
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: const CircularProgressIndicator(),
    );
  }
}
