import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/routes/routes.dart';
import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';
import 'package:movies_app_leal/features/auth/presentation/widgets/backgroud_container.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: SafeArea(
          child: Column(
            children: const [
              MoviesTitle(text: "Welcome!", fontSize: 25, centered: true),
              _Actions(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSignUp() {
      // TODO: implement _onSignUp
    }

    void _onLogIn() {
      Navigator.pushReplacementNamed(context, RoutesPages.login.name);
    }

    void _onForgotPassword() {
      // TODO: implement _onForgotPassword
    }

    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MoviesButton(
          text: "Sign up",
          onPressed: _onSignUp,
        ),
        MoviesButton(
          text: "Log in",
          normalButton: true,
          onPressed: _onLogIn,
        ),
        TextButton(
          onPressed: _onForgotPassword,
          style: ButtonStyle(
            overlayColor: MaterialStateColor.resolveWith(
              (_) => Colors.white.withOpacity(0.1),
            ),
          ),
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              fontSize: 16,
              color: white,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    ));
  }
}
