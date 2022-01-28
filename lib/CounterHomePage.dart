// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'CouterPage.dart';

class CounterHomePage extends StatefulWidget {
  const CounterHomePage({Key? key}) : super(key: key);

  @override
  _CounterHomePageState createState() => _CounterHomePageState();
}

GlobalKey<CounterPageState> key1 = GlobalKey();
GlobalKey<CounterPageState> key2 = GlobalKey();
GlobalKey<CounterPageState> key3 = GlobalKey();

List<CounterPage> pages = [];
int _selectedIndex = 0;

class _CounterHomePageState extends State<CounterHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _assignPages();
  }

  _assignPages() {
    setState(() {
      pages = [CounterPage(key1), CounterPage(key2), CounterPage(key3)];
    });
  }

  _assignTabs() {
    return <BottomNavigationBarItem>[BottomNavigationBarItem(
        icon: Icon(Icons.add_alarm_sharp),
        label: 'Counter 1',
      ),BottomNavigationBarItem(
        icon: Icon(Icons.add_alarm_sharp),
        label: 'Counter 2',
      ),BottomNavigationBarItem(
        icon: Icon(Icons.add_alarm_sharp),
        label: 'Counter 3',
      ),];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: _assignTabs(),
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}

}
