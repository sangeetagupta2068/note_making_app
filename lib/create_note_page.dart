import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_making_app/data_model/note_data.dart';
import 'list_of_notes.dart';

class CreateNotePage extends StatefulWidget {
  _CreateNotePageState createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {

  Note _note = Note();
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _titleEditingController, _descriptionEditingController;

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
                padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    "Title:",
                    style: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  TextField(
                    maxLines: 1,
                    controller: _titleEditingController,
                    onChanged: (value) => _note.title = value,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Text(
                    "Description:",
                    style: TextStyle(color: Colors.black, fontSize: 17.0),
                  ),
                  TextField(
                    maxLines: null,
                    controller: _descriptionEditingController,
                    onChanged: (value) => _note.description = value,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                      color: Colors.black,
                      onPressed: () {
                        _note.date =
                            DateTime.now().toIso8601String().toString();
                        saveNote();
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
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

  @override
  void initState() {
    super.initState();
    _titleEditingController = TextEditingController(text: _note.title);
    _descriptionEditingController =
        TextEditingController(text: _note.description);
  }

  void saveNote() async {
    FirebaseUser _firebaseUser = await _firebaseAuth.currentUser();
     Firestore.instance
        .collection('users')
        .document(_firebaseUser.email)
        .collection('notes').document(_note.title + _note.date)
        .setData({
      'title': _note.title,
      'description': _note.description,
      'date': _note.date,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context) => MyNoteListPage() )));
  }
}
