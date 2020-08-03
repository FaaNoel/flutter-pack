import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_times/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async{
    WorldTime wt = WorldTime(url: 'Asia/Shanghai', location:'Shanghai', flag:'china.pnh');
    await wt.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : wt.location,
      'flag' : wt.flag,
      'time' : wt.time,
      'isDaytime' : wt.isDaytime,
    });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
