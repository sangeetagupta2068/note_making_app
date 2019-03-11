import 'package:flutter/material.dart';
import 'create_note_page.dart';

class MyNoteListPage extends StatefulWidget {
  @override
  _MyNoteListState createState() => _MyNoteListState();
}

class _MyNoteListState extends State<MyNoteListPage> {
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
          child: ListView.builder(
            padding: EdgeInsets.all(0.0),
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.only(top: 6.0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "bleh",
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Text(DateTime.now().toIso8601String()),
                    SizedBox( height: 6.0,),
                    Divider(
                      color: Colors.white,
                    ),
                  ],
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CreateNotePage() ));
        },
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
//      bottomNavigationBar: BottomAppBar( elevation: 0.0,
//        color: Colors.deepPurpleAccent,
//        child: Text("\n\n"),
//      ),
    );
  }
}
