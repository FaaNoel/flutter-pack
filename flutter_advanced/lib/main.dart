import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search !"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final items = [
    "Don't let the bunny!",
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
    "No Time To Spare",
    "Sognare",
    "Realtor Extraordinaire",
    "Realität",
    "Afterimage",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {},
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
      onPressed: () {},
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentItems : items;

    return ListView.builder(itemBuilder: (context, index) =>
        ListTile(leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),),
      itemCount: suggestionList.length,
    );
  }
}
