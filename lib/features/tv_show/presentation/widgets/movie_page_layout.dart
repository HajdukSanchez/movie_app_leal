import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';

class MovieLayoutPage extends StatelessWidget {
  final String title;
  final Widget child;

  const MovieLayoutPage({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onSettings() {
      // TODO: Add logout
    }

    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: Text(title),
          actions: [
            MoviesActionButton(
              icon: Icons.settings_rounded,
              function: _onSettings,
              iconColor: grey,
            ),
          ],
        ),
        body: SingleChildScrollView(child: child));
  }
}
