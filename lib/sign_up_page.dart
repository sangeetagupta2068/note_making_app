import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpPage extends StatefulWidget{

  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>{

  String _email, _password, _name, _nextPassword;
  TextEditingController _emailTextEditingController, _passwordTextEditingController, _nameTextEditingController, _nextPasswordEditingController;

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    _emailTextEditingController = TextEditingController(text: _email);
    _passwordTextEditingController = TextEditingController(text: _password);
    _nextPasswordEditingController = TextEditingController(text: _nextPassword);
    _nameTextEditingController = TextEditingController(text: _name);

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
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              shrinkWrap: true,
              children: <Widget>[
                Text("Name:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                TextField(
                  controller: _nameTextEditingController,
                  onChanged: (value) => _name = value ,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),),
                ),
                SizedBox(height: 15.0),
                Text("Email:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                TextField(
                  controller: _emailTextEditingController,
                  onChanged: (value)=> _email = value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),),
                ),
                SizedBox(height: 15.0),
                Text("Password:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                TextField(
                  controller: _passwordTextEditingController,
                  onChanged: (value)=> _password = value,
                  obscureText: true,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),),
                ),
                SizedBox(height: 15.0),
                Text("Re-enter Password:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                TextField(
                  obscureText: true,
                  controller: _nextPasswordEditingController,
                  onChanged: (value)=> _nextPassword = value,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white54),
                    ),),
                ),
                SizedBox(height: 30.0,),
                RaisedButton(
                  child: Text("Sign up", style: TextStyle(color: Colors.white),),
                  color: Colors.black,
                  onPressed: (){
                    (_nextPassword == _password) ?
                    _firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password).then((user) {
                      Firestore.instance.collection('users').document(_email).setData({
                          'name' : _name,
                          'password' : _password,
                      });
                      Navigator.pop(context);
                    }
                    ).catchError((e) => print(e)) : print("Passwords don't match! ");
                  },
                )
              ],
            ),
          ),
           decoration: BoxDecoration(
             gradient: LinearGradient(
               begin: Alignment.topCenter,
               end: Alignment.bottomCenter,
               colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
             ),
           )
       ),
    );
  }


}