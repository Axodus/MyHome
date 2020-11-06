import 'package:YourHome/components/appBar.dart';
import 'package:YourHome/components/curvePtr.dart';
import 'package:YourHome/config/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
    );
  }
}