import 'package:YourHome/config/colors.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: secondary1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "^ ^",
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 60,
                    color: compl2
                  )
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "--------",
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 60,
                    color: compl2
                  )
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "This wasn't supposed to happen",
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 22,
                    color: compl2
                  )
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "pls restart the app",
                  style: TextStyle(
                    fontFamily: 'DinNext',
                    fontSize: 22,
                    color: compl2
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}