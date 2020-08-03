import 'package:flutter/material.dart';
import './list_page.dart' as first;
import './grid_page.dart' as second;

void main() {
  runApp(new MaterialApp(
    home: new TestHome(),

  ));
}

class TestHome extends StatefulWidget {
  @override
  _TestHomeState createState() => new _TestHomeState();
}

class _TestHomeState extends State<TestHome>
    with SingleTickerProviderStateMixin {

  TabController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("osu! Achievement"),
        backgroundColor: Colors.pink[400],

        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.list),
            ),
            new Tab(
              icon: new Icon(Icons.grid_on),
            ),
          ],
        ),
      ),


      body: new TabBarView(controller: controller, children: <Widget>[
        new first.ListPage(),
        new second.GridPage(),
      ]),

    );
  }
}
