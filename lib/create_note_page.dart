import 'package:flutter/material.dart';

class CreateNotePage extends StatefulWidget {
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
              child: ListView(
                padding: EdgeInsets.only(top : 0.0, bottom: 0.0),
                shrinkWrap: true,
                children: <Widget>[
                  Text("Title:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                  TextField(
                    maxLines: 1,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),),
                  ),
                  SizedBox(height: 15.0),
                  Text("Description:", style: TextStyle(color: Colors.black, fontSize: 17.0),),
                  TextField(
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Save", style: TextStyle( color:  Colors.white),),
                    ),
                  )
                ]
              ),

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
