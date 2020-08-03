import 'package:flutter/material.dart';
import 'package:flutter_listview/detail_page.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

void main() {
  runApp(new MaterialApp(
    title: "ListView",
    home: new Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.pink[900],
          title: new Text('Osu! Achievement'),
        ),
        body: new Container(
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
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
