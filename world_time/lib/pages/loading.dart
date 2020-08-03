import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {

    Response response = await get ('http://worldtimeapi.org/api/timezone/Asia/Jakarta');
    // print response body from link api
    Map data = jsonDecode(response.body);
    //print(data);

    //get properties from json
    String datetime = data['datetime'];
    String offset = data['utc_offset'].subsstring(1,3);
    //print(Dateime);
    //print(offset);

    //create DateTime Object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
