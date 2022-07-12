import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/information_container.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/favorites_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/home_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/recent_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _selectedIndex = 0;

  /// List of options depends on the selected index
  static const List<Map<String, dynamic>> _widgetPageOptions = <Map<String, dynamic>>[
    {
      'title': 'Home',
      "icon": Icons.home_filled,
      "page": HomePage(),
    },
    {
      'title': 'Favorites',
      "icon": Icons.favorite_border_rounded,
      "page": FavoritesPage(),
    },
    {
      'title': 'Recent',
      "icon": Icons.settings_backup_restore_rounded,
      "page": RecentPage(),
    },
    {
      'title': 'Search',
      "icon": Icons.search_rounded,
      "page": InformationContainer(
        icon: Icons.search_rounded,
        message: "Nothing to see here",
      ),
    }
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = BlocProvider.of<AuthBloc>(context, listen: false);

    void _onSettings() {
      authProvider.add(AuthLogoutEvent());
    }

    return Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          backgroundColor: black,
          elevation: 0,
          title: Text(_widgetPageOptions.elementAt(_selectedIndex)['title']),
          actions: [
            MoviesActionButton(
              icon: Icons.settings_rounded,
              function: _onSettings,
              iconColor: grey,
            ),
          ],
        ),
        body: Center(
          child: _widgetPageOptions.elementAt(_selectedIndex)['page'],
        ),
        bottomNavigationBar: _BottomBarNavigation(
          index: _selectedIndex,
          onTap: _onItemTapped,
          items: _widgetPageOptions,
        ));
  }
}

class _BottomBarNavigation extends StatelessWidget {
  final int index;
  final List<Map<String, dynamic>> items;
  final void Function(int) onTap;

  const _BottomBarNavigation({
    Key? key,
    required this.index,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        ...items
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(
                  item["icon"],
                  color: white,
                ),
                label: item["title"],
                activeIcon: Icon(
                  item["icon"],
                  color: yellow,
                ),
              ),
            )
            .toList()
      ],
      onTap: onTap,
      currentIndex: index,
      selectedItemColor: yellow,
      backgroundColor: Colors.black,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      type: BottomNavigationBarType.fixed,
    );
  }
}
