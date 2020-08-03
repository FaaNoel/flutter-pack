import 'package:flutter/material.dart';
import 'package:flutter_dicer/widgets/action_buttons.dart';
import 'package:flutter_dicer/widgets/dice_display.dart';
import 'package:flutter_dicer/widgets/menu_drawer.dart';
import 'package:flutter_dicer/widgets/sides_buttons.dart';

class DicePage extends StatelessWidget {
  DicePage({Key key, this.tittle}) : super(key: key);

  final String tittle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittle),
      ),

      drawer: MenuDrawer(),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Stack(
            children: <Widget>[
              DiceDisplay(),
              SidesButtons(),
              ActionButtons(),
            ],
          ),
        ),
    );
  }
}
