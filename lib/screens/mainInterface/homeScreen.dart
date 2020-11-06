import 'package:YourHome/components/appBar.dart';
import 'package:YourHome/components/curvePtr.dart';
import 'package:YourHome/config/colors.dart';
import 'package:YourHome/widgets/homeScreen/top.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Stack(
          children: [
            CustomPaint(
              size: MediaQuery.of(context).size,
              painter: CustomCurve(),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: topBar(context),
              ),
            )
          ],
        ),
        color: primary,
      )
    );
  }
}