import 'package:flutter/material.dart';
import 'list_of_notes.dart';

class MyLoginPage extends StatefulWidget {
  final String title;

  MyLoginPage({Key key, this.title}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  TextEditingController emailTextController, passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          child: Center(
            child: ListView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 0.0, bottom: 0.0),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    "Email:",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: emailTextController,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Password:",
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  TextField(
                    controller: passwordTextController,
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedErrorBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.black87,
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyNoteListPage()));
                    },
                  )
                ]),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
            ),
          )),
    );
  }
}
