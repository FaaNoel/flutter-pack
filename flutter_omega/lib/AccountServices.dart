import 'dart:convert';
import 'package:flutter_omega/navigation_bar_controller.dart';
import 'package:flutter_omega/pages/account.dart';

import 'pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });

  }

  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      login();

    }
  }

  login() async {
    final response = await http.post(
        "http://192.168.43.152/login/api/login.php", body: {
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

  savePref(int value, String username, String nama)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("nama", nama);
      preferences.setString("username", username);
      preferences.commit();
    });
  }
  var value;
  getPref()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  @override
  void initState(){
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    switch(_loginStatus){
      case LoginStatus.notSignIn:
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Login Your Account")),
          ),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                TextFormField(
                  validator: (e){
                    if(e.isEmpty){
                      return "Please Insert Username";
                    }
                  },
                  onSaved: (e)=>username = e,
                  decoration: InputDecoration(
                      labelText: "Username"
                  ),
                ),
                TextFormField(
                  obscureText: _secureText ,
                  onSaved: (e)=>password = e,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon:  Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: (){
                    check();
                  },
                  child: Text("Login"),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> Register()));
                  },
                  child: Text("CREATE A NEW ACCOUNT", textAlign: TextAlign.center,),
                )
              ],
            ),
          ),
        );

        break;
      case LoginStatus.signIn:
        return BottomNavigationBarController();
        break;
    }

  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}



class _RegisterState extends State<Register> {
  String username, password, nama;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check(){
    final form = _key.currentState;
    if(form.validate()){
      form.save();
      save();
    }
  }

  save()async {
    final response = await http.post(
        "http://192.168.43.152/login/api/register.php", body: {
      "nama": nama,
      "username": username,
      "password": password
    });


    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];

    if(value==1){
      setState(() {
        Navigator.pop(context);
      });
    }else{
      print(pesan);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Please insert fullname";
                }
              },
              onSaved: (e)=>nama = e,
              decoration: InputDecoration(
                  labelText: "Nama Lengkap"
              ),
            ),
            TextFormField(
              validator: (e){
                if(e.isEmpty){
                  return "Please Insert Username";
                }
              },
              onSaved: (e)=>username = e,
              decoration: InputDecoration(
                  labelText: "Username"
              ),
            ),
            TextFormField(
              obscureText: _secureText ,
              onSaved: (e)=>password = e,
              decoration: InputDecoration(
                labelText: "Password",
                suffixIcon: IconButton(
                  onPressed: showHide,
                  icon:  Icon(_secureText ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            MaterialButton(
              onPressed: (){
                check();
              },
              child: Text("REGISTER"),
            )

          ],

        ),
      ),
    );
  }
}