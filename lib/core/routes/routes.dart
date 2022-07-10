import 'package:flutter/material.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/login_page.dart';

/// Enum with applicatioon pages names to navigate to.
enum RoutesPages {
  // Login page
  login
}

/// Map with routes names associated to pages.
Map<String, Widget Function(BuildContext)> routes = {
  RoutesPages.login.name: (_) => const LoginPage(),
};
