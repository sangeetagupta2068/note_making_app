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

    DateTime dateTime  = DateTime.parse(widget.note.date);

    return Scaffold(
      appBar: AppBar(elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,),
      body: Container(

        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(widget.note.title,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600,),),
                  Text(dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString()),
          ]
      ),
            Divider(),
            TextField(
              decoration: new InputDecoration.collapsed(
                  hintText: widget.note.description,
                  hintStyle: TextStyle(fontSize: 17.0,color: Colors.black87),
              ),)
          ],
        ),
          decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
        ),
      )),
      floatingActionButton : FloatingActionButton(
          onPressed: (){},
          backgroundColor: Colors.black,
          child: Icon(Icons.mode_edit, color: Colors.white,),

          ),
    );
  }
}
