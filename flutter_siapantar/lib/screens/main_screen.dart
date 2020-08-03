import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sss/screens/cart.dart';
import 'package:flutter_sss/screens/favorite_screen.dart';
import 'package:flutter_sss/screens/home.dart';
import 'package:flutter_sss/screens/notifications.dart';
import 'package:flutter_sss/screens/profile.dart';
import 'package:flutter_sss/screens/search.dart';
import 'package:flutter_sss/util/const.dart';
import 'package:flutter_sss/widgets/badge.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
              centerTitle: false,
              title: Text(
                Constants.appName,
              ),
            elevation: 0.0,
              actions: <Widget>[
                IconButton(
                  icon: IconBadge(
                    icon: Icons.notifications,
                    size: 22.0,
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context){
                        return Notifications();
                      }
                    ));
                  },
                  tooltip: "Notifications",
                ),
              ],
          ),
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
            children: <Widget>[
              Home(),
              FavoriteScreen(),
              SearchScreen(),
              CartScreen(),
              Profile(),
            ],
          ),

          bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width:7),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  tooltip: 'Home',
                  color: _page == 0
                      ? Theme.of(context).accentColor
                      : Theme
                      .of(context)
                      .textTheme.caption.color,
                  onPressed: ()=>_pageController.jumpToPage(0),
                ),

                IconButton(
                  icon:Icon(
                    FontAwesomeIcons.comment,
                    size: 19.0,
                  ),
                  tooltip: 'Chat',
                  color: _page == 1
                      ? Theme.of(context).accentColor
                      : Theme
                      .of(context)
                      .textTheme.caption.color,
                  onPressed: ()=>_pageController.jumpToPage(1),
                ),

                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.boxOpen,
                    size: 24.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  tooltip: 'Drop-off',
                  color: _page == 2
                      ? Theme.of(context).accentColor
                      : Theme
                      .of(context)
                      .textTheme.caption.color,
                  onPressed: ()=>_pageController.jumpToPage(2),
                ),

                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.clipboardList,
                    size: 19.0,
                  ),
                  tooltip: 'My Order',
                  color: _page == 3
                      ? Theme.of(context).accentColor
                      : Theme
                      .of(context)
                      .textTheme.caption.color,
                  onPressed: ()=>_pageController.jumpToPage(3),
                ),

                IconButton(
                  icon: Icon(
                    Icons.person,
                    size: 24.0,
                  ),
                  tooltip: 'Profile',
                  color: _page == 4
                      ? Theme.of(context).accentColor
                      : Theme
                      .of(context)
                      .textTheme.caption.color,
                  onPressed: ()=>_pageController.jumpToPage(4),
                ),

                SizedBox(width:7),
              ],
            ),
            color: Theme.of(context).primaryColor,
            shape: CircularNotchedRectangle(),
          ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            elevation: 3.0,
            child: Transform.scale(
              scale: 1.5,
              child: ImageIcon(
                 AssetImage('assets/box.png',),
              ),
            ),
            onPressed: ()=>_pageController.jumpToPage(2),
          ),

        ),
    );
  }


  void navigationTapped(int page){
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
