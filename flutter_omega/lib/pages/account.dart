import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_omega/custom/CustomShapeClipper.dart';
import 'package:flutter_omega/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_omega/AccountServices.dart';
import 'package:gradient_text/gradient_text.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

enum LoginStatus { notSignIn, signIn }

class _AccountPageState extends State<AccountPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response =
        await http.post("http://10.10.2.70:80/login/api/login.php", body: {
      "username": username,
      "password": password,
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String usernameAPI = data['username'];
    String namaAPI = data['nama'];

    if (value == 1) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(value, usernameAPI, namaAPI);
      });
      print(pesan);
    } else {
      print(pesan);
    }
  }

  savePref(int value, String username, String nama) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
      preferences.commit();
    });
  }

  var value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(signOut),
    );
  }
}

class MainMenu extends StatefulWidget {
  final VoidCallback signOut;

  MainMenu(this.signOut);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  signOut() {
    setState(() {
      widget.signOut();
    });
  }

  String username = "", nama = "";

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username");
      nama = preferences.getString("nama");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(vsync: this, duration: new Duration(seconds: 7));

    animationController.repeat();

    getPref();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(255, 102, 171, .0),
          title: Text("Account"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text("Apakah kamu ingin keluar ?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Sign Out"),
                            onPressed: () {
                              signOut();
                              Login();
                            },
                          )
                        ],
                      );
                    });
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AnimatedBuilder(
                animation: animationController,
                  child: new Container(
                    height: 380.0,
                    width: 450.0,
                    child: new Image.asset('assets/images/osu-2019.png'),
                  ),
                builder: (BuildContext context, Widget _widget){
                  return new Transform.rotate(angle: animationController.value * 6.3,
                  child: _widget,);
                },
              ),
              Container(
                margin: EdgeInsets.only(left: 12.0),
                height: 100.0,
                child: Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: .10,
                      child: Text(
                        "You're Logging In !",
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Montserrat-Black",
                            letterSpacing: 1.0),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 70.0, left: 22.0),
                      child: Text(
                        "Username : $username",
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                child: Text(
                  "Nama : $nama",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Montserrat-Medium",
                      color: Color(0xFF9B9B9B)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
