import 'package:flutter/cupertino.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_omega/custom//CustomShapeClipper.dart';
import 'package:flutter_omega/pages/DetailPage.dart';
import 'package:flutter_omega/models/item_list.dart';
import 'package:backdrop/backdrop.dart';


Color firstColor = Color(0xFFFF66AA);
Color secondColor = Color(0xFFCF4DFF);

ThemeData appTheme =
ThemeData(primaryColor: Color(0xFFFF66AA), fontFamily: 'Oxygen');

List<String> locations = ['osu!Achievement', 'osu!Medals'];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                HomeScreenTopPart(),
                homeScreenBottomPart,
                homeScreenBottomPart2,
              ],
            ),
          )),
    );
  }
}


const TextStyle dropDownLabelStyle =
TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  HomeScreenTopPart ({Key key}) : super (key: key);
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  var selectedLocationIndex = 0;
  var isFlightSelected = true;
  var isOssSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [firstColor, secondColor],
              ),
            ),
            child: Column(children: <Widget>[
              SizedBox(
                height: 70.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.category, color: Colors.white),
                    SizedBox(
                      width: 16.0,
                    ),
                    PopupMenuButton(
                      onSelected: (index) {
                        setState(() {
                          selectedLocationIndex = index;
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            locations[selectedLocationIndex],
                            style: dropDownLabelStyle,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<int>>[
                        PopupMenuItem(
                          child: Text(
                            locations[0],
                            style: dropDownMenuItemStyle,
                          ),
                          value: 0,
                        ),
                        PopupMenuItem(
                          child: Text(
                            locations[1],
                            style: dropDownMenuItemStyle,
                          ),
                          value: 0,
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Search Achievements \nthat you havent gotten yet !',
                style: TextStyle(fontSize: 24.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: null),
                    style: dropDownMenuItemStyle,
                    cursorColor: appTheme.primaryColor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 32.0, vertical: 14.0),
                      suffixIcon: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AchievementsListingScreen()));
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                      onTap: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text('osu!'),
                        ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/mode-osu.png",
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          )
                        ],
                      )),
                  InkWell(
                    onTap: () {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('osu!mania'),
                      ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/mode-mania.png",
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text('osu!catch'),
                            ));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons/mode-fruits.png",
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              )
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('osu!taiko'),
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/mode-taiko.png",
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  ChoiceChip(this.icon, this.text, this.isSelected);

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
          color: Colors.white.withOpacity(0.15),
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ))
          : null,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              widget.icon,
              size: 20.0,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ]),
    );
  }
}

var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "Popular osu!Achievements",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18.0),
          ),
          Spacer(),
        ],
      ),
    ),
    Container(
      height: 220.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: itemCard,
      ),
    ),
    SizedBox(
      height: 20.0,
    ),
  ],
);

List<ItemCard> itemCard = [
  ItemCard(
    "http://haitai.jp/img/all-secret-challenge_accepted@2x.png",
    "Challenge Accepted",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-quickmaffs@2x.png",
    "Quick Maths",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-dancer@2x.png",
    "Non-Stop Dancer",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-ftb@2x.png",
    "Feel The Burn",
  ),
  ItemCard(
    "http://haitai.jp/img/all-secret-jack@2x.png",
    "Jack of All Trades",
  ),
];

class ItemCard extends StatelessWidget {
  final String imagePath, itemName;

  ItemCard(this.imagePath,
      this.itemName,);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage()),
            );
          },
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 210.0,
                    width: 160.0,
                    child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: imagePath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                width: 160.0,
                height: 60.0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.grey.withOpacity(0.1),
                          ])),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      child: Text(
                        itemName,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.0,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}




class Store {
  String judul;
  String gambar;

  Store.items({
    this.gambar,
    this.judul,
  });
}

List<Store> storeItems = [
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-challenge_accepted.png",
    judul: "",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-consolation_prize.png",
    judul: "Consolation Prize",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-dancer.png",
    judul: "Non-Stop Dancer",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-improved.png",
    judul: "Most Improved",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-rank-s.png",
    judul: "S-Ranker",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-jack.png",
    judul: "Jack of All Trades",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-nonstop.png",
    judul: "Nonstop",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-obsessed.png",
    judul: "Obsessed",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-quick_draw.png",
    judul: "Quick Draw",
  ),
  Store.items(
    gambar: "http://haitai.jp/img/all-secret-jackpot.png",
    judul: "Jackpot",
  ),
];

var homeScreenBottomPart2 = Container(
  height: 300,
  color: Colors.white30,
  child: GridView.builder(
    shrinkWrap: true,
    itemCount: storeItems.length,
    gridDelegate:
    new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(

        child: Container(
          child: GestureDetector(
            child: FadeInImage.memoryNetwork(placeholder: kTransparentImage, image: storeItems[index].gambar),
          ),
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => DetailPage()));
        },
      );
    },
  ),
);