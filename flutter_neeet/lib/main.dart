import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Quotes',
      theme: ThemeData(),
      home: new Scaffold(
          appBar: new AppBar(
            title: Center(child: Text('Quotes')),
          ),
          body: Center(
            child: FutureBuilder<Quote>(
              future: getQuote(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return Center(
                    child: Column(
                      children: <Widget>[
                        Card(
                            child: Padding(
                              padding: const EdgeInsets.all(50.0),
                                child: Text(
                          snapshot.data.quote,
                          textAlign: TextAlign.center,
                        ))),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(" - ${snapshot.data.author}"),
                      ],
                    ),
                  );
                else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          )),
    );
  }
}

Future<Quote> getQuote() async {
  String url = 'https://quotes.rest/qod.json';
  final response = await http.get(url, headers: {"Accept": "application/json"});

  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Post');
  }
}

class Quote {
  final String author;
  final String quote;

  Quote({this.author, this.quote});

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
        author: json['contents']['quotes'][0]['author'],
        quote: json['contents']['quotes'][0]['quote']);
  }
}
