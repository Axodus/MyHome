import 'package:flutter/material.dart';
import 'package:YourHome/config/colors.dart';

groupCard(context, groupName, state, openEdit) {
  return Container(
    child: new Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: GestureDetector(
        onTap: openEdit,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
          elevation: 12,
          color: secondary1,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    groupName,
                    style: TextStyle(
                      fontFamily: 'DinNext',
                      fontSize: 22,
                    ),
                  ),
                ),
              ),

              new Padding(
                padding: EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      color: state ? primary : compl1,
                      borderRadius: BorderRadius.circular(100)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ),
    height: MediaQuery.of(context).size.height * 0.1,
  );

}