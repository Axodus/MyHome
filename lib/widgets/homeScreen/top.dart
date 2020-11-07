import 'package:YourHome/config/colors.dart';
import 'package:flutter/material.dart';

topBar(BuildContext context, allLightSwitch) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5.0),
      color: compl1,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 2,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Stack(
      children: [
        new Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 7, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: primary,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Toggle all",
                  style: TextStyle(
                    color: compl2,
                    fontFamily: 'DinNext',
                    fontSize: 18
                  ),
                ),
              )
            )
          ),
        ),
        new Padding(
          padding: EdgeInsets.all(15.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: allLightSwitch
          ),
        ),
      ],
    ),
    width: MediaQuery.of(context).size.width * 0.9,
    height: MediaQuery.of(context).size.height * 0.05,
  );
}