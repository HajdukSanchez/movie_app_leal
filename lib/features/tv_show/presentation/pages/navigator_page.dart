import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
import 'package:movies_app_leal/core/widgets/movies_action_button.dart';
import 'package:movies_app_leal/features/auth/presentation/bloc/blocs.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/favorites_page.dart';
import 'package:movies_app_leal/features/tv_show/presentation/pages/home_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int _selectedIndex = 0;

  /// List of items to render and navigate
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FavoritesPage(),
    HomePage(),
    HomePage(),
  ];

  /// List of options depends on the selected index
  static const List<Map<String, dynamic>> _widgetPageOptions = <Map<String, dynamic>>[
    {
      'title': 'Home',
      'icon': Icons.home,
    },
    {
      'title': 'Favorites',
      'icon': Icons.favorite,
    },
    {
      'title': 'Recent',
      'icon': Icons.search,
    },
    {
      'title': 'Search',
      'icon': Icons.settings,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = _widgetPageOptions.elementAt(_selectedIndex)['title'];
    final authProvider = BlocProvider.of<AuthBloc>(context, listen: false);

    void _onSettings() {
      authProvider.add(AuthLogoutEvent());
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: white,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home_filled,
              color: yellow,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_rounded,
              color: white,
            ),
            label: 'Favorites',
            activeIcon: Icon(
              Icons.favorite_border_rounded,
              color: yellow,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_backup_restore_rounded,
              color: white,
            ),
            label: 'Recent',
            activeIcon: Icon(
              Icons.settings_backup_restore_rounded,
              color: yellow,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
              color: white,
            ),
            label: 'Search',
            activeIcon: Icon(
              Icons.search_rounded,
              color: yellow,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: yellow,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
