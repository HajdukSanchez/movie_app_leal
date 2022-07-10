import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            MoviesTitle(text: "Welcome!", fontSize: 25, centered: true),
            _Actions(),
          ],
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
    void _onSignUp() {}

    void _onLogIn() {}

    void _onForgotPassword() {}

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
