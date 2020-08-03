import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new ListPage(),
  ));
}

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.7, 0.9],
                colors: [
                  Colors.purple[800],
                  Colors.purple[700],
                  Colors.purple[600],
                  Colors.purple[400],
                ],

              ),
            ),
            child: new ListView(
              children: <Widget>[
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-challenge_accepted.png",
                  judul: "Challenge Accepted",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-consolation_prize.png",
                  judul: "Consolation Prize",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-dancer.png",
                  judul: "Non-Stop Dancer",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-improved.png",
                  judul: "Most Improved",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-rank-s.png",
                  judul: "S-Ranker",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-jack.png",
                  judul: "Jack of All Trades",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-nonstop.png",
                  judul: "Nonstop",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-obsessed.png",
                  judul: "Obsessed",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-quick_draw.png",
                  judul: "Quick Draw",
                ),
                new ListItem(
                  gambar: "http://haitai.jp/img/all-secret-jackpot.png",
                  judul: "Jackpot",
                ),
              ],
            )
        ));
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.gambar, this.judul});

  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(

      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new InkWell(

          onTap: (){
            print("tertekan");
          },

          child: new Row(
            children: <Widget>[
              new Image(
                image: new NetworkImage(gambar),
                width: 80.0,
              ),
              new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Center(
                    child: new Column(
                      children: <Widget>[
                        new Text(judul, style: new TextStyle(fontSize: 20.0),
                        )
                      ],
                    )
                ),
              )


            ],
          ),
        ),
      ),
    );

  }
}
