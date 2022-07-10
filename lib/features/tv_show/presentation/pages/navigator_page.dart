import 'package:flutter/material.dart';

import 'package:movies_app_leal/core/theme/theme_data.dart';
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
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
