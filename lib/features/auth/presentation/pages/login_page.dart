import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/routes/routes.dart';
import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/core/widgets/movies_button.dart';
import 'package:movies_app_leal/core/widgets/movies_text_field.dart';
import 'package:movies_app_leal/core/widgets/movies_title.dart';
import 'package:movies_app_leal/features/auth/data/models/auth_model.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';
import 'package:movies_app_leal/features/auth/presentation/widgets/backgroud_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: BackgroundContainer(
        child: Container(
          padding: EdgeInsets.only(top: topPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              MoviesTitle(text: "Welcome!", fontSize: 25, centered: true),
              _LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = BlocProvider.of<AuthBloc>(context);
    final TextEditingController nameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void _onLogin() {
      final authData = AuthModel(name: nameController.text, password: passwordController.text);
      authProvider.add(AuthLoginEvent(auth: authData));
      if (authProvider.state is AuthLoadedState) {
        Navigator.pushReplacementNamed(context, RoutesPages.home.name);
      }
    }

    void _onClose() {
      Navigator.pushReplacementNamed(context, RoutesPages.welcome.name);
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
              function: _onClose,
              icon: Icons.close_rounded,
              iconColor: grey,
              splasColor: yellow,
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
