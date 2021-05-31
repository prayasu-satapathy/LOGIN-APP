import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String _welcomeString = " ";

  void _erase() {
    setState(() {
      _userController.clear();
      _passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("USER-LOGIN",
        style: new TextStyle(
          color: Colors.black,fontStyle: FontStyle.italic
        ),),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              'image/Syenah Logo Black.jpeg',
              width: 90.0,
              height: 90.0,
            ),
            new Container(
              height: 180.0,
              width: 300.0,
              color: Colors.deepOrange,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                        hintText: 'Username', icon: new Icon(Icons.person)),
                  ),

                  new TextField(
                    controller: _passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(Icons.lock),
                    ),
                    obscureText: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)), //add padding
                  new Center(
                    child: new Row(
                      children: <Widget>[
                        // Login button
                        new Container(
                          margin: const EdgeInsets.only(left: 38.0),
                          child: new RaisedButton(
                              onPressed: _showWelcome,
                              color: Colors.lightGreenAccent,
                              child: new Text("Login",
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 16.9))),
                        ),
                        new Container(
                          margin: const EdgeInsets.only(left: 120.0),
                          child: new RaisedButton(
                              onPressed: _erase,
                              color: Colors.lightGreenAccent,
                              child: new Text("Clear",
                                  style: new TextStyle(
                                      color: Colors.black, fontSize: 16.9))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            new Padding(padding: const EdgeInsets.all(14.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "$_welcomeString",
                  style: new TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    'image/Syenah Logo Black.jpeg',
                    width: 300.0,
                    height: 300.0,
                  ),

          ],),
        ]),
      ),
    );
  }

  void _showWelcome() {
    setState(() {
      if (_userController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        _welcomeString = "Welcome "+_userController.text;
      } else
        _welcomeString = "Wrong Details Entered";
    });
  }
}
