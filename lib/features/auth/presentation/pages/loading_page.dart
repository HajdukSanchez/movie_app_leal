import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/welcome_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/home_page.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case AuthInitialState:
              return const WelcomePage();
            case AuthLoadingState:
              return const _LoadingIndicator();
            case AuthLoadedState:
              return const HomePage();
            case AuthErrorState:
              return const WelcomePage();
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
