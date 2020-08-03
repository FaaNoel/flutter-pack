

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      drawer: Drawer(),
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
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty? recentItems : items;

    return ListView.builder(itemBuilder: (context, index) => ListTile(
      leading: Icon(Icons.favorite_border),
      title: Text(suggestionList[index]),
    ));
  }
}
