import 'package:flutter/material.dart';
import 'favorite.dart';
import 'account.dart';

import 'main.dart';

class CustomBottomAppBar extends StatefulWidget {
  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  final List<Widget> pages = [
    HomeScreen(
      key: PageStorageKey('Page1'),
    ),
    FavoritesListingScreen(
      key: PageStorageKey('Page2'),
    ),
    AccountListingScreen(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    onTap: (int index) => setState(() => _selectedIndex = index),
    currentIndex: selectedIndex,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.add), title: Text('First Page')),
      BottomNavigationBarItem(
          icon: Icon(Icons.list), title: Text('Second Page')),
      BottomNavigationBarItem(
          icon: Icon(Icons.done_all), title: Text('Third Page')),
    ],
  );

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
        body: PageStorage(
          child: pages[_selectedIndex],
          bucket: bucket,
        ),
    );
  }
}
