import 'package:flutter/material.dart';
import 'pages/favorite.dart';
import 'pages/account.dart';
import 'pages/home.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    HomePage(
      key: PageStorageKey('Page1'),
    ),
    FavoritePage(
      key: PageStorageKey('Page2'),
    ),
    AccountPage(
      key: PageStorageKey('Page3'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();



  int _selectedIndex = 0;
  final bottomNavigationBarItemStyle =
  TextStyle(fontStyle: FontStyle.normal, color: Colors.black);
  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.black,
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.dashboard,
              ),
              icon: Icon(Icons.dashboard,),
              title: Text('Dashboard',  )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.favorite,
              ),
              icon: Icon(Icons.favorite,), title: Text('Favorite')),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.account_circle,
              ),
              icon: Icon(Icons.account_circle,), title: Text('Account',)),
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
