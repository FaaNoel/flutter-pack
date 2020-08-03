import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class DetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/mode-osu.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,)
              ],
            )
        ),
        SizedBox(height: 10.0),
        Text(
          "Don't let the bunny distract you!",
          style: TextStyle(color: Colors.white, fontSize: 30.0),
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage("http://haitai.jp/img/all-secret-bunny@2x.png"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.all(40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(255, 128, 193, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 60.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "Get 371 combo on Normal difficulty or 447 combo on Hard difficulty Chatmonchy - Make Up! Make Up!",
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: _launchURL,
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
          Text("Go To Beatmaps", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // color: Theme.of(context).primaryColor,
      padding: EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}

_launchURL() async {
  const url = "https://osu.ppy.sh/beatmapsets/492000#mania/1048210";
  if ( await canLaunch(url)){
    await launch(url);
  }
  else{
    throw'Tidak bisa membuka Beatmap ini $url';
  }
}

