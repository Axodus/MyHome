import 'package:YourHome/config/colors.dart';
import 'package:flutter/material.dart';

appBar() {
  return PreferredSize(
    preferredSize: Size.fromHeight(0.7),
    child: AppBar(
      flexibleSpace: Container(
        color: compl2,
      ),
    ),
  );
}