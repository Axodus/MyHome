import 'package:YourHome/config/colors.dart';
import 'package:YourHome/screens/mainInterface/allLights.dart';
import 'package:YourHome/screens/mainInterface/homeScreen.dart';
import 'package:YourHome/screens/mainInterface/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State < Home > {

  int currentIndex = 0;

  final List < Widget > _children = [
    HomeScreen(),
    AllLights(),
    Settings()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: primary,
        onTap: _onItemTapped,
        unselectedItemColor: compl1,
        backgroundColor: compl2,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Home",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.lightbulb),
            label: "Lights",
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            label: "Settings",
          )
        ],
      ),
    );
  }
}