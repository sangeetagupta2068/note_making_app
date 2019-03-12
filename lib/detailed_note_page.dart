import 'package:flutter/material.dart';
import 'package:note_making_app/data_model/note_data.dart';

class DetailedNotePage extends StatefulWidget{
  Note note;
  DetailedNotePage(this.note) : super();

  @override
  _DetailedNotePageState createState() => _DetailedNotePageState();
}

class _DetailedNotePageState extends State<DetailedNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,),
      body: Container( decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
        ),
      )),
    );
  }
}
