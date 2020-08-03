import 'package:flutter/material.dart';
import 'package:flutter_commerce/UI/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  void initState() {
    super.initState();
    getLayout();
  }

  navigate(){


  }

  String user;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: user == "Evankhell"?
        Container(child: Text(user),):
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: getLayout,
                  child: Text(user ?? "GG"),
                ),
                RaisedButton(
                  onPressed: deletUser,
                  child: Text("Remove"),
                )
              ],
            )
      ),
    );
  }

  deletUser() async{
    final pref = await SharedPreferences.getInstance();
    pref.remove('user');
    setState(() {
      user = pref.getString('user') ?? "0";
    });
  }

  getLayout() async{
    final pref = await SharedPreferences.getInstance();
    pref.setString('user', 'Evankhell');

    print("Was here: " + pref.getString('user'));
    setState(() {
      user = pref.getString('user') ?? "0";
    });
    if(pref.getString('user') == "Evankhell"){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => Menu()
      ));
    }
  }
}
