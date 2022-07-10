import 'package:flutter/material.dart';

import 'package:movies_app_leal/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/welcome_page.dart';

/// Enum with applicatioon pages names to navigate to.
enum RoutesPages {
  /// Welcome home page.
  welcome,
  // Login page
  login
}

/// Map with routes names associated to pages.
Map<String, Widget Function(BuildContext)> routes = {
  RoutesPages.welcome.name: (_) => const WelcomePage(),
  RoutesPages.login.name: (_) => const LoginPage(),
};