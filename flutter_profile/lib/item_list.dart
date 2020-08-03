import 'package:flutter/material.dart';
import 'package:flutter_profile/DetailPage.dart';
import 'package:flutter_profile/main.dart';
import 'CustomShapeClipper.dart';

final Color itemsBackgroundColor = Color(0xFFFFE08D);
final Color achievementBorderColor = Color(0xFFE6E6E6);
final Color chipBackgroundColor = Color(0xFFF6F6F6);

class AchievementsListingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Result"),
        elevation: 0.0,
        centerTitle: true,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: DecoratedBox(
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
              AchievementsListingBottomPart(),
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
        Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              elevation: 10.0,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextField(
                            controller: TextEditingController(text: null),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            showSearch(
                                context: context, delegate: DataSearch());
                          },
                        ))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final items = [
    "Don't let the bunny distract you!",
    "S-Ranker",
    "Most Improved",
    "Non-stop Dancer",
    "Consolation Prize",
    "Challenge Accepted",
    "Stumbler",
    "Jackpot",
    "Quick Draw",
    "Obsessed",
    "Nonstop",
    "Jack of All Trades",
    "Perseverance",
    "Feel the burn",
    "Time Dilation",
    "Just One Second",
    "Afterimage",
    "To The Core",
    "Prepared",
    "Eclipse",
    "Reckless Abandon",
    "Tunnel Vision",
    "Behold No Deception",
    "Up For The Challenge",
    "Lights Out",
    "Camera Shy",
    "The Sum Of All Fears",
    "Dekasight",
    "Unstoppable",
    "Is This Real Life?",
    "Hour Before The Dawn",
    "Slow And Steady",
    "No Time To Spare",
    "Sognare",
    "Realtor Extraordinaire",
    "Realität",
    "Our Mechanical Benefactors",
    "Meticulous",
    "Infinitesimal",
    "Equilibrium",
    "Impeccable",
  ];

  final recentItems = [
    "Don't let the bunny distract you!",
    "S-Ranker",
    "Most Improved",
    "Non-stop Dancer",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Card(
        color: Colors.pink,
        shape: StadiumBorder(),
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentItems
        : items.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          showResults(context);
        },
        leading: Icon(Icons.favorite_border),
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold
                  ),
              children: [
                TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class AchievementsListingBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Results :",
              style: dropDownMenuItemStyle,
            ),
          ),
          Container(
            height: 445.0,
            child: ListView(
              addAutomaticKeepAlives: true,
              scrollDirection: Axis.vertical,
              children: achievementsCard,
            ),
          ),
        ],
      ),
    );
  }
}

List<AchievementsCard> achievementsCard = [
  AchievementsCard(
    "http://haitai.jp/img/all-secret-challenge_accepted@2x.png",
    "Challenge Accepted",
  ),
  AchievementsCard(
    "http://haitai.jp/img/all-secret-quickmaffs@2x.png",
    "Quick Maths",
  ),
  AchievementsCard(
    "http://haitai.jp/img/all-secret-dancer@2x.png",
    "Non-Stop Dancer",
  ),
  AchievementsCard(
    "http://haitai.jp/img/all-secret-ftb@2x.png",
    "Feel The Burn",
  ),
  AchievementsCard(
    "http://haitai.jp/img/all-secret-jack@2x.png",
    "Jack of All Trades",
  ),
];

class AchievementsCard extends StatelessWidget {
  final String imagePath, itemName;

  AchievementsCard(
    this.imagePath,
    this.itemName,
  );

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
          },
          child: new Row(
            children: <Widget>[
              new Image(
                image: new NetworkImage(imagePath),
                width: 80.0,
              ),
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Center(
                    child: new Column(
                  children: <Widget>[
                    new Text(
                      itemName,
                      style: new TextStyle(fontSize: 20.0),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
