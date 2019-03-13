import 'package:flutter/material.dart';
import 'list_of_notes.dart';
import 'sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyLoginPage extends StatefulWidget {
  final String title;

  MyLoginPage({Key key, this.title}) : super(key: key);

  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  TextEditingController _emailTextController, _passwordTextController;
  String _email, _password;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController(text: _email);
    _passwordTextController = TextEditingController(text: _password);
  }

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
                    controller: _emailTextController,
                    onChanged: (value) => _email = value,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
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
                    controller: _passwordTextController,
                    onChanged: (value) => _password = value,
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
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
                      _firebaseAuth.signInWithEmailAndPassword(email: _email, password: _password)
                          .then((user) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyNoteListPage())))
                          .catchError((e) => print(e));
                    },
                  ),
                  SizedBox(height: 30.0),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: Text(
                      "Don\'t have an account? Sign up",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.white54,
                        fontSize: 17.0,
                      ),
                    ),
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
