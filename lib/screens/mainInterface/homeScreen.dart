import 'dart:convert';

import 'package:YourHome/components/appBar.dart';
import 'package:YourHome/components/curvePtr.dart';
import 'package:YourHome/config/colors.dart';
import 'package:YourHome/config/config.dart';
import 'package:YourHome/config/defaultValues.dart';
import 'package:YourHome/helpers/hue.dart';
import 'package:YourHome/screens/errorScreen.dart';
import 'package:YourHome/widgets/homeScreen/groupCard.dart';
import 'package:YourHome/widgets/homeScreen/groupManipulate.dart';
import 'package:YourHome/widgets/homeScreen/noGroupsMsg.dart';
import 'package:YourHome/widgets/homeScreen/top.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List < TableRow > groups;
  bool allLightsToggle = false;
  bool groupsToggle = false;
  bool hasGroups = false;

  String username = developerUsn;
  String bridgeIP = developerIP;

  void initState() {
    super.initState();

    getGroups();
    getAllLightsState();
    checkAllLightsState();

    groups = < TableRow > [
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

  Future < dynamic > getGroups() async{

    // Making get request for data
    var response = await getRequest(username, bridgeIP, 'groups');
    

    Map < String, dynamic > lightGroups = jsonDecode(response);
    print(lightGroups);
    print(lightGroups.length);
    
    if (lightGroups.length == 0) {
      setState(() {
        hasGroups = false;
      });
    } else {
      setState(() {
        hasGroups = true;
      });
    }

    for (int i = 1; i < lightGroups.length + 1; i++) {
      var individualGroup = lightGroups[("$i")];
      var groupName = individualGroup["name"];
      var groupLightsState = individualGroup["state"]["all_on"];
      var lightGroupBrightness = individualGroup["action"]["bri"].toDouble();

      var lGrBri = lightGroupBrightness;

      print(groupName);
      print("$groupName brightness: $lightGroupBrightness");

      if (groupLightsState == false) {
        lightGroupBrightness = 0.0;
      }

      setState(() {
        groups.add(
          new TableRow(
            children: [
              groupCard(
                context,
                groupName,
                groupLightsState,
                lGrBri,
                groupLightsState,
                i,
                'groups',
                'action'
              )
            ]
          )
        );
      });
    }
    return groups;
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
                      "YOUR GROUPS",
                      style: TextStyle(
                        fontFamily: 'DinNext',
                        color: compl1,
                        fontSize: 22
                      ),
                    ),
                  ),
                ),

                hasGroups ? new Table(
                  border: null,
                  children: groups,
                )
                :
                Align(
                  alignment: Alignment.center,
                  child: noDataMessage(context, "groups"),
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