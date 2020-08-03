import 'package:flutter/material.dart';
import 'package:flutter_profile/main.dart';
import 'CustomShapeClipper.dart';


final Color itemsBackgroundColor = Color(0xFFFFE08D);
final Color achievementBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class FavoritesListingScreen extends StatefulWidget {
  const FavoritesListingScreen({Key key}) : super(key: key);
  @override
  _FavoritesListingScreenState createState() => _FavoritesListingScreenState();
}

class _FavoritesListingScreenState extends State<FavoritesListingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:
      DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
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

