import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/util/dialog_messages.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_text_field.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';
import 'package:movies_app_leal/features/auth/data/models/auth_model.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';
import 'package:movies_app_leal/features/auth/presentation/widgets/background_container.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late bool showLoginForm;

  @override
  void initState() {
    showLoginForm = false;
    super.initState();
  }

  void _moveToLogin() {
    setState(() {
      showLoginForm = !showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundContainer(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MoviesTitle(text: "Welcome!", fontSize: 25, centered: true),
              showLoginForm
                  ? _LoginForm(
                      onDispose: _moveToLogin,
                    )
                  : _ActionsForm(
                      onLogin: _moveToLogin,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionsForm extends StatelessWidget {
  final Function() onLogin;

  const _ActionsForm({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSignUp() {
      // TODO: implement _onSignUp
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
          onPressed: onLogin,
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

class _LoginForm extends StatelessWidget {
  final Function() onDispose;

  const _LoginForm({
    Key? key,
    required this.onDispose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _onLogin() {
      if (nameController.text.isEmpty || passwordController.text.isEmpty) {
        showDialogMessage(
          context,
          "Alert",
          message: "Please fill all fields",
          icon: Icons.edit_rounded,
        );
      } else {
        final authData = AuthModel(name: nameController.text, password: passwordController.text);
        BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(auth: authData));
      }
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: black.withOpacity(0.9),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            MoviesActionButton(
              function: onDispose,
              icon: Icons.close_rounded,
              iconColor: grey,
              splashColor: yellow,
            ),
            MoviesTextField(controller: nameController, hintText: "Name"),
            MoviesTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(height: 80),
            MoviesButton(
              text: "Log in",
              onPressed: _onLogin,
              normalButton: true,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
