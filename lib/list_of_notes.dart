import 'package:flutter/material.dart';
import 'create_note_page.dart';
import 'package:note_making_app/data_model/note_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'detailed_note_page.dart';

class MyNoteListPage extends StatefulWidget {
  @override
  _MyNoteListState createState() => _MyNoteListState();
}

class _MyNoteListState extends State<MyNoteListPage> {
  List<Note> notes = [];
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void getListOfNotes() async {
    FirebaseUser _firebaseUser = await _firebaseAuth.currentUser();
    Firestore.instance
        .collection('users')
        .document(_firebaseUser.email)
        .collection('notes')
        .getDocuments()
        .then((snapshot) {
      snapshot.documents.forEach((document) => this.setState(() { notes.add(Note(
          description: document.data['description'],
          title: document.data['title'],
          date: document.data['date']));
      })
      );
    });
  }

  void deleteItem(Note note, int index) async {
    FirebaseUser _firebaseUser = await _firebaseAuth.currentUser();
    Firestore.instance
        .collection('users')
        .document(_firebaseUser.email)
        .collection('notes')
        .document(note.title + note.date)
        .delete()
        .then((value) => this.setState((){notes.removeAt(index);}));
  }

  void undoDeletion(Note _note, int index) async {
    FirebaseUser _firebaseUser = await _firebaseAuth.currentUser();
    Firestore.instance
        .collection('users')
        .document(_firebaseUser.email)
        .collection('notes')
        .document(_note.title + _note.date)
        .setData({
      'title': _note.title,
      'description': _note.description,
      'date': _note.date,
    }).then((value) => this.setState(() {notes.insert(index, _note); this.initState();}));
  }

  @override
  void initState() {
    super.initState();
    getListOfNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: (notes.length == 0)? Center(child: Text("No notes yet.",style: TextStyle(fontSize: 20.0,),)):ListView.builder(
            padding: EdgeInsets.all(0.0),
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(notes[index]),
                onDismissed: (direction) {
                  deleteItem(notes[index], index);
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Item deleted"),
                      action: SnackBarAction(
                          label: "Undo deletion",
                          onPressed: () {
                            //To undo deletion
                            undoDeletion(notes[index], index);
                          })));
                },
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailedNotePage(notes[index]))),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 6.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  notes[index].title,
                                  style: TextStyle(fontSize: 25.0),
                                ),
                                Text(DateTime.parse(notes[index].date).day.toString() + "/" + DateTime.parse(notes[index].date).month.toString() + "/" + DateTime.parse(notes[index].date).year.toString()),
                              ],
                            ),
                            Icon(
                              Icons.delete,
                              size: 33.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Divider(
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.lightBlueAccent, Colors.deepPurpleAccent],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreateNotePage()));
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
