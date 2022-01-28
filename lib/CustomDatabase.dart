import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CustomDatabase extends StatefulWidget {
  const CustomDatabase({Key? key}) : super(key: key);

  @override
  _CustomDatabaseState createState() => _CustomDatabaseState();
}

class _CustomDatabaseState extends State<CustomDatabase> {
  final referenceDatabase = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
