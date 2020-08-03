import 'package:flutter/material.dart';
import 'package:flutter_omega/custom/CustomShapeClipper.dart';
import 'package:flutter_omega/pages/home.dart';

final Color itemsBackgroundColor = Color(0xFFFFE08D);
final Color achievementBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              AchievementsListingTopPart(),
            ],
          ),
        ),
      ),
    );
  }
}

class AchievementsListingTopPart extends StatelessWidget {
  @override
  Widget build(context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipperDetail(),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [firstColor, secondColor])),
            height: 160.0,
          ),
        ),
      ],
    );
  }
}
