import 'package:flutter/material.dart';

import 'package:movies_app_leal/features/auth/presentation/pages/loading_page.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/login_page.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/welcome_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/favorites_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/navigator_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/poster_detail_page.dart';

/// Enum with applicatioon pages names to navigate to.
enum RoutesPages {
  // Loading page (page to handle auth state).
  loading,
  // Welcome home page.
  welcome,
  // Login page
  login,
  // Home page (with tvShows lists).
  home,
  // Favorites TvShow page.
  favorites,
  // Poster detail page (Page to see the poster more detailed).
  posterDetail
}

/// Map with routes names associated to pages.
Map<String, Widget Function(BuildContext)> routes = {
  RoutesPages.loading.name: (_) => const LoadingPage(),
  RoutesPages.welcome.name: (_) => const WelcomePage(),
  RoutesPages.login.name: (_) => const LoginPage(),
  RoutesPages.home.name: (_) => const NavigatorPage(),
  RoutesPages.favorites.name: (_) => const FavoritesPage(),
  RoutesPages.posterDetail.name: (_) => const PosterDetailPage(),
};
