import 'package:YourHome/components/appBar.dart';
import 'package:YourHome/components/curvePtr.dart';
import 'package:YourHome/config/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State < Settings > {

  var testVal = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackShape: RoundedRectSliderTrackShape(),
              trackHeight: 15.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
              thumbColor: Colors.redAccent,
              overlayShape: RoundSliderOverlayShape(overlayRadius: 0.0),
              inactiveTickMarkColor: Colors.red[100]
            ),
            child: Slider(
              value: testVal,
              min: 0.0,
              max: 254.0,
              divisions: 254,
              onChanged: (value) {
                setState(() {
                  testVal = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}