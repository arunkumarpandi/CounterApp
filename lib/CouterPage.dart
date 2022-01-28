

// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
   CounterPage(Key  key) : super(key: key);

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage> {
  int value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter $value')),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          color: Colors.blue,
          child: Text(
            'Increment me!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          elevation: 0, child: Icon(Icons.add), onPressed: increment),
    );
  }

  increment() {

  }
}
