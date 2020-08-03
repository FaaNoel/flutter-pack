import 'package:flutter/material.dart';
import 'package:flutter_learnapi/model/user_model.dart';
import 'package:flutter_learnapi/page_get_data.dart';

class PagePassingValue extends StatefulWidget {
  @override
  _PagePassingValueState createState() => _PagePassingValueState();
}

class _PagePassingValueState extends State<PagePassingValue> {

  var _userController = new TextEditingController();
  var _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passing Value Page'),
        backgroundColor: Colors.green,
      ),

      body: new Container(
        child: new Center(
          child: new Column(
            children: <Widget>[
              Padding(
                child: new Text('Please input the data', style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
          padding: EdgeInsets.only(bottom: 20.0),
              ),

              TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                  hintText: 'Input Username'
                ),
              ),

              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Input Email'
                ),
              ),

              MaterialButton(
                color: Colors.green,
                textColor: Colors.white,
                onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PageGetValue(
                    value: UserModel(
                      username: _userController.text,
                      email: _emailController.text,
                    ),
                 )));


                },child: Text('UwU'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
