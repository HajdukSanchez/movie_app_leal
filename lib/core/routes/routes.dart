import 'package:flutter/material.dart';

import 'package:movies_app_leal/features/auth/presentation/pages/loading_page.dart';
import 'package:movies_app_leal/features/auth/presentation/pages/welcome_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/details_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/favorites_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/navigator_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/poster_detail_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/recent_detail_page.dart';

/// Enum with application pages names to navigate to.
enum RoutesPages {
  // Loading page (Page to handle auth state).
  loading,
  // Welcome page (Page to handle auth state to navigate and handle user information).
  welcome,
  // Home page (Page to see the main Information about popular and recommended Tv Shows).
  home,
  // Favorites page (Page to see user favorites TvShows).
  favorites,
  // Poster detail page (Page to see the poster more detailed).
  posterDetail,
  // Recent detail page (Page to see information about recent TvShows).
  recentDetail,
  // Details page (Page to see information about TvShows before start watching).
  details
}

/// Map with routes names associated to pages.
Map<String, Widget Function(BuildContext)> routes = {
  RoutesPages.loading.name: (_) => const LoadingPage(),
  RoutesPages.welcome.name: (_) => const WelcomePage(),
  RoutesPages.home.name: (_) => const NavigatorPage(),
  RoutesPages.favorites.name: (_) => const FavoritesPage(),
  RoutesPages.posterDetail.name: (_) => const PosterDetailPage(),
  RoutesPages.recentDetail.name: (_) => const RecentDetailPage(),
  RoutesPages.details.name: (_) => const DetailsPage(),
};
