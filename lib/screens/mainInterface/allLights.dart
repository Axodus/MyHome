import 'dart:convert';

import 'package:YourHome/components/appBar.dart';
import 'package:YourHome/components/curvePtr.dart';
import 'package:YourHome/config/colors.dart';
import 'package:YourHome/config/config.dart';
import 'package:YourHome/config/defaultValues.dart';
import 'package:YourHome/helpers/hue.dart';
import 'package:YourHome/screens/errorScreen.dart';
import 'package:YourHome/widgets/homeScreen/groupCard.dart';
import 'package:YourHome/widgets/homeScreen/noGroupsMsg.dart';
import 'package:YourHome/widgets/homeScreen/top.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllLights extends StatefulWidget {
  @override
  _AllLightsState createState() => _AllLightsState();
}

class _AllLightsState extends State<AllLights> {
  List < TableRow > lights;
  bool allLightsToggle = false;
  bool lightsToggle = false;
  bool hasLights = false;

  String username = developerUsn;
  String bridgeIP = developerIP;

  void initState() {
    super.initState();

    getLights();
    getAllLightsState();
    checkAllLightsState();

    lights = < TableRow > [
      new TableRow(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0)
        ),
        children: [
          Align(
            alignment: Alignment.center,
          ),
        ]
      )
    ];
  }

  checkAllLightsState() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    if (storage.getBool('allLightsOn') == true) {
      setState(() {
        allLightsToggle = true;
      });
    } else if (storage.getBool('allLightsOn') == false) {
      setState(() {
        allLightsToggle = false;
      });
    } else {
      Navigator.push(
      context,
        MaterialPageRoute(builder: (context) => ErrorScreen()),
      );
    }
  }

  editLightAttr() {
    print("light attributes edit");
  }

  Future < dynamic > getLights() async{

    // Making get request for data
    var response = await getRequest(username, bridgeIP, 'lights');
    
    Map < String, dynamic > allLights = jsonDecode(response);
    print(allLights);
    print(allLights.length);
    
    if (allLights.length == 0) {
      setState(() {
        hasLights = false;
      });
    } else {
      setState(() {
        hasLights = true;
      });
    }

    for (int i = 1; i < allLights.length + 1; i++) {
      var individualLight = allLights[("$i")];
      var lightName = individualLight["name"];
      var lightState = individualLight["state"]["on"];
      var lightBrightness = individualLight["state"]["bri"];

      var lBri = lightBrightness.toDouble();

      print(lightName);

      setState(() {
        lights.add(
          new TableRow(
            children: [
              groupCard(
                context,
                lightName,
                lightState,
                lBri,
                lightState,
                i,
                'lights',
                'state',
              )
            ]
          )
        );
      });
    }
    return lights;
  }

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
            ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "YOUR LIGHTS",
                      style: TextStyle(
                        fontFamily: 'DinNext',
                        color: secondary2,
                        fontSize: 22
                      ),
                    ),
                  ),
                ),

                hasLights ? new Table(
                  border: null,
                  children: lights,
                )
                :
                Align(
                  alignment: Alignment.center,
                  child: noDataMessage(context, "lights"),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: topBar(
                  context,
                  Switch(
                    activeColor: primary,
                    activeTrackColor: secondary1,
                    value: allLightsToggle,
                    onChanged: (value) {
                      setState(() {
                        allLightsToggle = value;

                        String lightsToggle = '{"on": $allLightsToggle}';

                        toggleAllLights(lightsToggle);
                      });
                    }
                  )
                ),
              ),
            ),
          ],
        ),
        color: primary,
      )
    );
  }
}