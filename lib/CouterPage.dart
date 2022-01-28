// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:collection';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final String page;
  CounterPage(
    Key key,
    this.page,
  ) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int value = 0;

  final referenceDatabase = FirebaseDatabase.instance;
  late DatabaseReference ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assignRef();
    _assignData();
  }

  _assignData() async {
    await ref.child(widget.page).once().then((result) {
      var v = result.snapshot.value;
      Map<String, dynamic> _post = Map<String, dynamic>.from(v as Map);
      String key =
          _post.keys.toString().replaceAll('(', '').replaceAll(')', '');
      setState(() {
        value = int.parse(_post[key]['value'].toString());
      });
    });
  }

  _assignRef() {
    setState(() {
      ref = referenceDatabase.reference();
    });
  }

  _reset() {
    setState(() {
      value = 0;
    });
    ref.child(widget.page).remove();
    ref.child(widget.page).push().child('value').set(value).asStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter $value'),
        actions: [
          IconButton(
              onPressed: () {
                _reset();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            increment();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
            color: Colors.blue,
            child: Text(
              'Increment me!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0,
          child: Icon(Icons.add),
          onPressed: () {
            increment();
          }),
    );
  }

  increment() {
    setState(() {
      value++;
    });
    ref.child(widget.page).remove();
    ref.child(widget.page).push().child('value').set(value).asStream();
  }
}
