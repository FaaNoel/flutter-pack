import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_abalabalmvp/contracts/main_activity_contract.dart';
import 'package:flutter_abalabalmvp/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_abalabalmvp/login_act.dart';
import 'package:flutter_abalabalmvp/presenters/main_activity_presenter.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                        content: Text("Apakah kamu ingin keluar ?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("SIGN OUT"),
                            onPressed: (){
                              _logout();
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginActivity()), (r) =>false);
                            },
                          ),
                        ]
                    );
                  });
            },
          ),
        ],
      ),
      body: Center(
        child: MyHomePage(),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MainActivityView{
  bool isLoading = true;
  MainActivityPresenter presenter;

  List<Post> posts = new List();

  List<String> names = new List<String>();




  final String url = "https://swapi.co/api/people";

  @override
  void initState() {
    super.initState();
    this.getJsonData();

    isNotLoggedIn().then((it) {
      if(it){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginActivity()));}
      return;
    });
    presenter = MainActivityPresenter(this);


  }
  Future<String> getJsonData() async {
    var response = await http.get(
      //Encode the url
        Uri.encodeFull(url),
        //only accept json response
        headers: {"Accept": "application/json"}
    );

    var jsonified = json.decode(response.body);
    var results = jsonified['results'];

    results.forEach((elem) => {
      names.add(elem['name'])
    });

    setState(() {
      isLoading = false;
    });

    return "Success";
  }


  Future<bool> isNotLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = (prefs.getString('api_token') ?? "undefined");
    return (token == null || token == "undefined");
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading ? ShimmerList() : DataList(names);
  }



  @override
  void toast(String message) => Toast.show(message, context);

}
class DataList extends StatelessWidget {
  final List<String> names;

  DataList(this.names);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: names == null ? 0 : names.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new Center(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Card(
                  child: new Container(
                      child: new Text(names[index], style: TextStyle(color: Colors.lightBlueAccent),),
                      padding: const EdgeInsets.all(20.0)),

                ),
              ],
            ),
          ),
        );

      },
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int offset = 0;
    int time = 800;

    return SafeArea(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          offset += 5;
          time = 800 + offset;

          print(time);

          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Shimmer.fromColors(
                highlightColor: Colors.white,
                baseColor: Colors.grey[300],
                child: ShimmerLayout(),
                period: Duration(milliseconds: time),
              ));
        },
      ),
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 220;
    double containerHeight = 15;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 7.5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 100,
            width: 100,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.75,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}



